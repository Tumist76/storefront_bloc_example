import 'package:flutter/material.dart';
import '../../../domain/entities/category.dart';

class CategoriesActionBar extends StatelessWidget {
  const CategoriesActionBar({
    Key? key,
    required this.categories,
    required this.padding,
    this.selectedCategoryId,
    required this.onCategorySelected,
  }) : super(key: key);

  final List<Category> categories;

  final int? selectedCategoryId;

  final double padding;

  final Function(int) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _getRowItems(),
        ),
      ),
    );
  }

  List<Widget> _getRowItems() {
    final selectedId = selectedCategoryId ?? categories[0].id;
    final rowItems = <Widget>[];
    for (var i = 0; i < categories.length; i++) {
      rowItems.add(Padding(
          padding: EdgeInsets.only(
            right: padding,
            left: i == 0 ? padding : 0.0,
          ),
          child: categories[i].id == selectedId
              ? ActionChip(
                  label: Text(
                    categories[i].title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  backgroundColor: const Color(0xFFE4C93F),
                  onPressed: () {},
                )
              : TextButton(
                  onPressed: () {
                    onCategorySelected(categories[i].id);
                  },
                  child: Text(categories[i].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white30,
                      )),
                )));
    }
    return rowItems;
  }
}
