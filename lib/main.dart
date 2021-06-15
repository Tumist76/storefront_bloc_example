import 'package:flutter/material.dart';

import 'injector.dart' as get_it;
import 'ui/catalog/catalog_screen.dart';

void main() {
  get_it.init();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storefront BLoC Example',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        accentColor: Colors.yellowAccent,
        primaryColor: const Color(0xFF000000),
        scaffoldBackgroundColor: const Color(0xFF000000),
      ),
      home: const CatalogScreen(),
    );
  }
}
