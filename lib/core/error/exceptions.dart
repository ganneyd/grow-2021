///Thrown when an error occurs when a call is made to a server
class ServerException implements Exception {}

///Thrown when an error is encountered while  creating a
/// document in the database
class CreateDataException implements Exception {}

///Thrown when an error is encountered while  updating a
/// document in the database
class UpdateDataException implements Exception {}

///Thrown when an error is encountered while  reading a
/// document in the database
class ReadDataException implements Exception {}

///Thrown when an error is encountered while  deleteing a
/// document in the database
class DeleteDataException implements Exception {}

///Thrown when an error is encountered while caching data or retriving data that
///was cached
class CacheException implements Exception {}
