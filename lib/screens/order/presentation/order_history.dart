import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final orderListData = [
    {
      "title": "Order #12345",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "June 10, 2023",
      "status": "Delivered",
    },
    {
      "title": "Order #67890",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "June 22, 2025",
      "status": "In Transit",
    },
    {
      "title": "Order #12345",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "June 10, 2023",
      "status": "Delivered",
    },
    {
      "title": "Order #12389",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "March 22 , 2025",
      "status": "Processing",
    },
    {
      "title": "Order #12345",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "June 10, 2023",
      "status": "Delivered",
    },
    {
      "title": "Order #98745",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "May 22 , 2024",
      "status": "cancelled",
    },
    {
      "title": "Order #67890",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "June 22, 2025",
      "status": "In Transit",
    },
    {
      "title": "Order #12389",
      "description":
          "Discover a world of unique, handcrafted products made with love by"
          " talented artisans from around the globe.",
      "date": "March 22 , 2025",
      "status": "Processing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order History"), centerTitle: true),

      body: ListView.builder(
        itemCount: orderListData.length,

        itemBuilder: (BuildContext context, int index) {
          final item = orderListData[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                item["title"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Status: ${item["status"]}\n"
                "Date: ${item["date"]} \n"
                " Order Details:${item["description"]} ",
              ),
            ),
          );
        },
      ),
    );
  }
}
