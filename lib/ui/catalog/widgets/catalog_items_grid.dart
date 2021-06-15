import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../domain/entities/item.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    Key? key,
    required this.items,
    required this.horizontalPadding,
    required this.itemSpacing,
  }) : super(key: key);

  final List<Item> items;

  final double horizontalPadding;

  final double itemSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 14.0,
        mainAxisSpacing: 14.0,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, index) {
          return _GridItem(item: items[index]);
        },
        staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: const Color(0xFF2E2E2E),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _getCardText(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCardText() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 40.0,
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('${item.price} ₽'),
              ),
              Text(
                '${item.weight} гр.',
                style: const TextStyle(color: Colors.white38),
              ),
            ],
          )
        ],
      ),
    );
  }
}
