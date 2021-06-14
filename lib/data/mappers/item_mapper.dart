import '../../domain/entities/item.dart';
import '../models/item_model.dart';
import 'mapper.dart';

class ItemMapper implements Mapper<ItemModel, Item> {
  @override
  Item mapTo(ItemModel model) {
    return Item(
        id: model.id,
        title: model.title,
        price: model.price,
        weight: model.weight,
        image: model.image);
  }
}
