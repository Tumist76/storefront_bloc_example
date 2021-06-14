import '../../domain/entities/category.dart';
import '../models/category_model.dart';
import 'mapper.dart';

class CategoryMapper implements Mapper<CategoryModel, Category> {
  @override
  Category mapTo(CategoryModel model) {
    return Category(id: model.id, title: model.title);
  }
}
