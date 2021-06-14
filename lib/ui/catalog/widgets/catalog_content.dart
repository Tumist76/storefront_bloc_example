import 'package:flutter/material.dart';
import '../../../domain/entities/catalog.dart';

import 'catalog_categories_action_bar.dart';
import 'catalog_items_grid.dart';

class CatalogContent extends StatelessWidget {
  const CatalogContent({
    Key? key,
    required this.catalog,
    required this.onCategorySelected,
    this.selectedCategoryId,
  }) : super(key: key);

  final Catalog catalog;

  final Function(int) onCategorySelected;

  final int? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CategoriesActionBar(
          categories: catalog.categories,
          selectedCategoryId: selectedCategoryId,
          onCategorySelected: onCategorySelected,
          padding: 10.0,
        ),
        const SizedBox(height: 10.0),
        ItemsGrid(
          items: catalog.items,
        ),
      ],
    );
  }
}
