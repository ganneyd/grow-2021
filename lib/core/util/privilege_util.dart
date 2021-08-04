///The different privileges an admin can have
///[ALL] is for the developer who can practically do everything
///[EDIT_SCHOOL]  is for an admin who can edit an school's fields
///[READ_SCHOOL] is for an admin who can see an school's data
///[CREATE_SCHOOL] is for an admin who can create a new school
///[DELETE_SCHOOL] is for an admin who can delete a school
///[READ_CHILDREN] is for an admin who can see all the children
///[EDIT_CHILDREN] is for an admin who can edit a child's info (minimal)
///[READ_SCHOOL_ROUTES] is for an admin who can see routes specific to a school
///[READ_GLOBAL_ROUTES] is for an admin who can see all routes that are public( not created by a child)
///[EDIT_PUBLIC_ROUTES] is for an admin who can edit routes that are public
///[EDIT_SCHOOL_ROUTES] is for an admin who can edit routes that are specific to a school
///[CREATE_GLOBAL_ROUTES] is for an admin who can create global routes that all children can access
///[CREATE_SCHOOL_ROUTES] is for an admin who can create routes that are specific  to a school and only children attending that school have access
///[DELETE_SCHOOL_ROUTES] is for an admin who can delete a school's route
///[DELETE_GLOBAL_ROUTES] is for an admin who can delete a global route

enum Priviallge {
  ALL,
  EDIT_SCHOOL,
  READ_SCHOOL,
  CREATE_SCHOOL,
  DELETE_SCHOOL,
  CREATE_CHILDREN_ACC,
  READ_CHILDREN_ACC_SCHOOL,
  EDIT_CHILDREN_ACC_SCHOOL,
  READ_CHILDREN_ACC_ADMIN,
  EDIT_CHILDREN_ACC_ADMIN,
  READ_CHILDREN_ACC_PARENT,
  EDIT_CHILDREN_ACC_PARENT,
  READ_SCHOOL_ROUTES,
  READ_GLOBAL_ROUTES,
  EDIT_PUBLIC_ROUTES,
  EDIT_SCHOOL_ROUTES,
  CREATE_GLOBAL_ROUTES,
  CREATE_SCHOOL_ROUTES,
  DELETE_SCHOOL_ROUTES,
  DELETE_GLOBAL_ROUTES
}
