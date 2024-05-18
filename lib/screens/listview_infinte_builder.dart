import 'package:flutter/material.dart';

class MyListViewInfinte extends StatefulWidget {
  const MyListViewInfinte({super.key});

  @override
  State<MyListViewInfinte> createState() => _MyListViewInfinteState();
}

class _MyListViewInfinteState extends State<MyListViewInfinte> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  Future refresh() async {
    setState(() {
      items = ['Item 4', 'Item 5', 'Item 6'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            children: [
              Text(item),
              // ListTile(
              //   title: Container(
              //       width: 50,
              //       child: Text(item),
              //       constraints: BoxConstraints(minWidth: 0)),
              // )
            ],
          );
        },
      ),
    );
  }
}
