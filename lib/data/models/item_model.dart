import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.weight,
    required this.image,
  });

  @JsonValue('id')
  int id;

  @JsonValue('title')
  String title;

  @JsonValue('price')
  double price;

  @JsonValue('weight')
  double weight;

  @JsonValue('image')
  String image;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
