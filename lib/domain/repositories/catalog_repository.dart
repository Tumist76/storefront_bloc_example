import '../entities/catalog.dart';

abstract class CatalogRepository {
  Future<Catalog> getCatalog();
}
