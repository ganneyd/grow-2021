///Datasource that connects to the firestore database
import 'package:grow_run_v1/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

///Contract for the RemoteDatasources
abstract class RemoteDataSource {
  ///method to be override so that data is populated in the database,
  ///takes the [docID], the [jsonData]  and the [collectionName]
  ///the then creates the appropriate document in the collection
  ///with the [docID]  and populates it with the [jsonData] passed
  ///throws a [CreateDataException] for all errors
  ///calls [FirebaseFirestore] methods
  Future<void> createData(
      {required String collectionName,
      required Map<String, dynamic> jsonData,
      String? docID});

  ///method to be override so that data is updated in the database,
  ///takes the [docID], the [jsonData]  and the [collectionName]
  ///the then updates the appropriate document in the collection
  ///with the [docID] updates the document with the  [jsonData] passed
  ///throws a [UpdateDataException] for all errors
  ///calls [FirebaseFirestore] methods
  Future<void> updateData(
      String collectionName, Map<String, dynamic> jsonData, String docID);

  ///method to be override so that one single entry
  /// is retrieved from the database,
  ///takes the [docID],and the [collectionName]
  ///with the [docID]  and [collectionName] it retrieves the
  /// appropriate document
  ///from the database
  ///throws a [ReadDataException] for all errors
  ///calls [FirebaseFirestore] methods
  Future<Map<String, dynamic>> getData(String collectionName, String docID);

  ///method that returns a whole collection of data.
  /// takes the [collectionName] and then finds that collection
  /// and returns the [QuerySnapshot] for that collection
  Future<List<Map<String, dynamic>>> getCollection(String collectionName);

  ///method that allows the database to be queried
  Future<List<Map<String, dynamic>>> queryCollection(
      String collection, String fieldName,
      {dynamic isEqualTo,
      dynamic isNotEqualTo,
      dynamic isLessThan,
      dynamic isLessThanOrEqualTo,
      dynamic isGreaterThan,
      dynamic isGreaterThanOrEqualTo,
      dynamic arrayContains,
      List<dynamic>? arrayContainsAny,
      List<dynamic>? whereIn,
      List<dynamic>? whereNotIn,
      bool? isNull});

  ///method to be override so that data is deleted in the database,
  ///takes the [docID], and the [collectionName]
  ///to delete the appropriate document
  ///throws a [DeleteDataException] for all errors
  ///calls [FirebaseFirestore] methods
  Future<void> deleteData(String collectionName, String docID);
}

//*****************************************************************************/

///Implementation of [RemoteDataSource]
///takes an [FireBaseFirestore] instance so that the data stored in the database
///can be manipulated and fetched;
class RemoteDataSourceImplementation extends RemoteDataSource {
  ///constructor
  RemoteDataSourceImplementation(this.database)
      : _remoteDatabaseLogger = Logger('Remote_Database');

  ///reference to firestore database;
  final FirebaseFirestore database;
  final Logger _remoteDatabaseLogger;

  ///Function that returns a list of JSON data
  List<Map<String, dynamic>> _getJsonList(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    //list to hold the json data returned from the database
    final List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[];
    if (snapshot.docs.isNotEmpty) {
      for (final DocumentSnapshot<Map<String, dynamic>> docSnapshot
          in snapshot.docs) {
        _remoteDatabaseLogger.finest('found a doc');
        final Map<String, dynamic> data = docSnapshot.data()!;
        data['uid'] = docSnapshot.reference.id;
        _remoteDatabaseLogger.finest(data);
        jsonList.add(data);
      }
    }
    return jsonList;
  }

  @override
  Future<void> createData(
      {required String collectionName,
      required Map<String, dynamic> jsonData,
      String? docID}) async {
    try {
      //returns after the children collection finishes creating the childData
      return await database.collection(collectionName).doc(docID).set(jsonData);
    } catch (e) {
      //if an
      throw CreateDataException();
    }
  }

  @override
  Future<void> deleteData(String collectionName, String docID) async {
    try {
      //deletes the document from the database
      return await database.collection(collectionName).doc(docID).delete();
    } catch (e) {
      throw DeleteDataException();
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      String collectionName, String docID) async {
    try {
      //returns the document snapshot of the document retrieved
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await database.collection(collectionName).doc(docID).get();
      final Map<String, dynamic> data = snapshot.data()!;
      data['uid'] = snapshot.id;
      return Future<Map<String, dynamic>>.value(data);
    } catch (e) {
      throw ReadDataException();
    }
  }

  @override
  Future<void> updateData(String collectionName, Map<String, dynamic> jsonData,
      String docID) async {
    try {
      return await database
          .collection(collectionName)
          .doc(docID)
          .update(jsonData);
    } catch (e) {
      throw UpdateDataException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection(
      String collectionName) async {
    //list to hold the json data returned from the database
    List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[];
    try {
      //returns the query snapshot of the document retrieved
      final QuerySnapshot<Map<String, dynamic>> snapshots =
          await database.collection(collectionName).get();
      // if (snapshots.docs.isEmpty) {
      //   throw Exception();
      // }
      jsonList = _getJsonList(snapshots);
      _remoteDatabaseLogger.finest(jsonList);
      return Future<List<Map<String, dynamic>>>.value(jsonList);
    } catch (e) {
      _remoteDatabaseLogger.finest('error in datasources $e');
      throw ReadDataException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> queryCollection(
      String collectionName, String fieldName,
      {dynamic isEqualTo,
      dynamic isNotEqualTo,
      dynamic isLessThan,
      dynamic isLessThanOrEqualTo,
      dynamic isGreaterThan,
      dynamic isGreaterThanOrEqualTo,
      dynamic arrayContains,
      List<dynamic>? arrayContainsAny,
      List<dynamic>? whereIn,
      List<dynamic>? whereNotIn,
      bool? isNull}) async {
    //list to hold the json data returned from the database
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await database
          .collection(collectionName)
          .where(
            fieldName,
            isEqualTo: isEqualTo,
            isNotEqualTo: isNotEqualTo,
            isLessThan: isLessThan,
            isLessThanOrEqualTo: isLessThanOrEqualTo,
            isGreaterThan: isGreaterThan,
            isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
            arrayContains: arrayContains,
            arrayContainsAny: arrayContainsAny,
            whereIn: whereIn,
            whereNotIn: whereNotIn,
            isNull: isNull,
          )
          .get();
      return Future<List<Map<String, dynamic>>>.value(_getJsonList(snapshot));
    } catch (e) {
      throw ReadDataException();
    }
  }
}
