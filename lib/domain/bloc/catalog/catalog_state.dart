part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  CatalogLoaded({required this.catalog, this.selectedCategoryId});

  final Catalog catalog;

  final int? selectedCategoryId;
}
