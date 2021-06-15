import 'package:flutter/material.dart';
import '../../../domain/entities/catalog.dart';

import 'catalog_categories_chip_bar.dart';
import 'catalog_items_grid.dart';

class CatalogContent extends StatelessWidget {
  const CatalogContent({
    Key? key,
    required this.catalog,
    required this.onCategorySelected,
    this.selectedCategoryId,
    required this.horizontalPadding,
    required this.itemSpacing,
  }) : super(key: key);

  final Catalog catalog;

  final Function(int) onCategorySelected;

  final int? selectedCategoryId;

  final double horizontalPadding;

  final double itemSpacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoriesChipBar(
            categories: catalog.categories,
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: onCategorySelected,
            itemSpacing: itemSpacing,
            horizontalPadding: horizontalPadding,
          ),
          const SizedBox(height: 10.0),
          ItemsGrid(
            items: catalog.items,
            horizontalPadding: horizontalPadding,
            itemSpacing: itemSpacing,
          ),
        ],
      ),
    );
  }
}
