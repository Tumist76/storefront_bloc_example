import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../entities/catalog.dart';
import '../../repositories/catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({
    required this.catalogRepository,
  }) : super(CatalogInitial());

  final CatalogRepository catalogRepository;

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is GetCatalog) {
      yield CatalogLoading();
      final catalog = await catalogRepository.getCatalog();
      yield CatalogLoaded(catalog: catalog);
    }
    if (event is SelectCatalogCategory && state is CatalogLoaded) {
      final currentState = state as CatalogLoaded;
      yield CatalogLoaded(
          catalog: currentState.catalog, selectedCategoryId: event.categoryId);
    }
  }
}
