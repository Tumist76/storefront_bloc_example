import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entities/catalog.dart';
import '../mappers/catalog_mapper.dart';
import '../models/catalog_model.dart';

class CatalogDataSource {
  CatalogDataSource({required this.catalogMapper});

  final CatalogMapper catalogMapper;

  Future<Catalog> getCatalog() async {
    await Future.delayed(const Duration(seconds: 2));
    final response =
        await rootBundle.loadString('assets/example_data/catalog.json');
    final jsonMap = jsonDecode(response) as Map<String, dynamic>;
    final catalogModel = CatalogModel.fromJson(jsonMap);
    return catalogMapper.mapTo(catalogModel);
  }
}
