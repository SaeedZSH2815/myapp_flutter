import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyListViewInfinte extends StatefulWidget {
  const MyListViewInfinte({super.key});

  @override
  State<MyListViewInfinte> createState() => _MyListViewInfinteState();
}

class _MyListViewInfinteState extends State<MyListViewInfinte> {
  List<String> items = [];
  final ctrl = ScrollController();
  int page = 1;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    refresh();
    ctrl.addListener(() {
      if (ctrl.position.maxScrollExtent == ctrl.offset) refresh();
    });
  }

  Future refresh() async {
    // setState(() {
    //   items.clear();
    // });
    final limit = 25;
    final http.Response r = await http.get(Uri.parse(
        "http://jsonplaceholder.typicode.com/posts?_page=$page&_limit=25"));
    if (r.statusCode == 200) {
      final List newitems = json.decode(r.body);
      setState(() {
        page++;
        if (newitems.length < 25) hasMore = false;
        items.addAll(newitems.map<String>(
          (e) {
            final num = e['id'];
            return 'Item_$num';
          },
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: items.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  controller: ctrl,
                  itemCount: items.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < items.length) {
                      final String item = items[index];
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(item));
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: hasMore
                            ? CircularProgressIndicator()
                            : Text("no Data"),
                      );
                    }
                  }),
            ),
    );
  }
}
