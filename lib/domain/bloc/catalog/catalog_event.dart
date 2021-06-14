part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class GetCatalog extends CatalogEvent {}

class SelectCatalogCategory extends CatalogEvent {
  SelectCatalogCategory({required this.categoryId});

  final int categoryId;
}
