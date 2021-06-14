import 'package:flutter/material.dart';
import '../../../domain/entities/item.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemCount: items.length,
        itemBuilder: (_, index) {
          return _ItemsGridCard(item: items[index]);
        },
      ),
    );
  }
}

class _ItemsGridCard extends StatelessWidget {
  const _ItemsGridCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E2E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Image.asset(item.image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _getCardText(),
            ),
          ),
        ],
      ),
    );
  }

  Column _getCardText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(item.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${item.price} ₽'),
            Text(
              '${item.weight} гр.',
              style: const TextStyle(color: Colors.white38),
            ),
          ],
        )
      ],
    );
  }
}
