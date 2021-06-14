import 'package:get_it/get_it.dart';
import 'data/data_sources/catalog_data_source.dart';
import 'data/mappers/catalog_mapper.dart';
import 'data/repositories/catalog_data_repository.dart';
import 'domain/bloc/catalog/catalog_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory<CatalogBloc>(
    () => CatalogBloc(
      catalogRepository: sl<CatalogDataRepository>(),
    ),
  );

  sl.registerLazySingleton(() => CatalogDataRepository(
        catalogDataSource: sl(),
      ));
  sl.registerLazySingleton(() => CatalogDataSource(catalogMapper: sl()));
  sl.registerLazySingleton(() => CatalogMapper());
}
