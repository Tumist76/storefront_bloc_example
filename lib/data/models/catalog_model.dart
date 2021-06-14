import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';
import 'item_model.dart';

part 'catalog_model.g.dart';

@JsonSerializable()
class CatalogModel {
  CatalogModel({
    required this.categories,
    required this.items,
  });

  List<CategoryModel> categories;

  List<ItemModel> items;

  factory CatalogModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogModelToJson(this);
}
