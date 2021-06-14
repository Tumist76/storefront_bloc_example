import 'category.dart';
import 'item.dart';

class Catalog {
  Catalog({
    required this.categories,
    required this.items,
  });

  List<Category> categories;

  List<Item> items;
}
