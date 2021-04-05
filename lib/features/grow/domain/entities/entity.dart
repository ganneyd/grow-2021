///For every entity to implement

abstract class Entity {
  ///Every entity class should extend this class
  ///and override this method to return its entity type
  ENTITY_TYPE get();
}

///[ENTITY_TYPE] designates the name of the collection that will be stored in the database

enum ENTITY_TYPE {
  ADMIN,
  BACKGROUND,
  CHILD,
  CLOTHING,
  GOAL,
  PARENT,
  ROUTE,
  SCHOOL,
  TROPHY
}
