import '../../domain/entities/catalog.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../data_sources/catalog_data_source.dart';

class CatalogDataRepository implements CatalogRepository {
  CatalogDataRepository({required this.catalogDataSource});

  final CatalogDataSource catalogDataSource;

  @override
  Future<Catalog> getCatalog() async => catalogDataSource.getCatalog();
}
