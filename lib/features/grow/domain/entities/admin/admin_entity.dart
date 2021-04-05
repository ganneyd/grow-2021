import 'package:grow_run_v1/core/util/util.dart';

///Admin entity
///TODO better documentation
class AdminEntity {
  ///Constructor
  AdminEntity(
      {required this.firstname,
      required this.lastname,
      required this.priviallges});

  ///Admin's firstname
  final String firstname;

  ///Admin's lastname
  final String lastname;

  ///Admin's priviallges
  final List<Priviallge>? priviallges;
}
