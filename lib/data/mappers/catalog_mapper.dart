import '../../domain/entities/catalog.dart';
import '../models/catalog_model.dart';
import 'category_mapper.dart';
import 'item_mapper.dart';
import 'mapper.dart';

class CatalogMapper implements Mapper<CatalogModel, Catalog> {
  final itemMapper = ItemMapper();
  final categoryMapper = CategoryMapper();
  @override
  Catalog mapTo(CatalogModel model) {
    return Catalog(
      categories: model.categories.map(categoryMapper.mapTo).toList(),
      items: model.items.map(itemMapper.mapTo).toList(),
    );
  }
}
