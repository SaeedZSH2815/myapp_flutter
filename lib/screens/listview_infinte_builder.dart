import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyListViewInfinte extends StatefulWidget {
  const MyListViewInfinte({super.key});

  @override
  State<MyListViewInfinte> createState() => _MyListViewInfinteState();
}

class _MyListViewInfinteState extends State<MyListViewInfinte> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  Future refresh() async {
    final http.Response r =
        await http.get(Uri.parse("http://127.0.0.1:8000/home/alltodo_apiView"));
    if (r.statusCode == 200) {
      final List itemList = json.decode(r.body);
      setState(() {
        items = ['Item 4', 'Item 5', 'Item 6'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final String item = items[index];
              return ListTile(
                  leading: const Icon(Icons.list),
                  trailing: const Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text(item));
            }),
      ),
    );
  }
}
