import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:myapp_flutter/models/products.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({super.key, required this.items});
  List<ProductModelProvider> items;
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypeAheadField<ProductModelProvider>(
        controller: ctrl,
        itemBuilder: (context, ProductModelProvider value) {
          return ListTile(
            title: Text(value.title),
          );
        },
        onSelected: (value) {},
        suggestionsCallback: (search) {
          return items.where(
            (element) {
              return element.title.contains(search);
            },
          ).toList();
        },
      ),
    );
  }
}
