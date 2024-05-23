import 'package:flutter/material.dart';



class ProductModelProvider  {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isfav;

  ProductModelProvider(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageurl,
      this.isfav = false});
  }

  final List<ProductModelProvider> pitems = [
    ProductModelProvider(
        id: "1",
        title: "A Pen",
        price: 90.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    ProductModelProvider(
        id: "2",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    ProductModelProvider(
        id: "3",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2021/11/1636616854_C7gX4.jpg"),
    ProductModelProvider(
        id: "4",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://xchap.com/60-thickbox_default/%DA%86%D8%A7%D9%BE-%D8%AA%DB%8C%D8%B4%D8%B1%D8%AA-%D9%85%D8%B4%DA%A9%DB%8C-%D8%B3%DB%8C%D8%A7%D9%87.jpg"),
    ProductModelProvider(
        id: "5",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.iranpooshak.com/wp-content/uploads/2019/07/x-1.jpg"),
  ];
