import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/catalog/catalog_bloc.dart';
import '../../injector.dart';
import '../loading_widget.dart';
import 'widgets/catalog_content.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: const CatalogScreenBody(),
    );
  }
}

class CatalogScreenBody extends StatelessWidget {
  const CatalogScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CatalogBloc>()..add(GetCatalog()),
      child: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
        if (state is CatalogLoaded) {
          return CatalogContent(
            catalog: state.catalog,
            onCategorySelected: (id) => context
                .read<CatalogBloc>()
                .add(SelectCatalogCategory(categoryId: id)),
            selectedCategoryId: state.selectedCategoryId,
            itemSpacing: 12.0,
            horizontalPadding: 16.0,
          );
        }
        return const LoadingWidget();
      }),
    );
  }
}
