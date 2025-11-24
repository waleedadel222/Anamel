import 'package:anamel/screens/address/address_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/app_routing.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final List<AddressModel> addressesList = [
    AddressModel(
      governorate: '',
      city: '',
      street: '',
      building: '',
      apartment: '',
      landmark: '',
      zipCode: '',
      isDefault: false,
    ),

    AddressModel(
      governorate: '',
      city: '',
      street: '',
      building: '',
      apartment: '',
      landmark: '',
      zipCode: '',
      isDefault: true,
    ),
    AddressModel(
      governorate: '',
      city: '',
      street: '',
      building: '',
      apartment: '',
      landmark: '',
      zipCode: '',
      isDefault: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Addresses"), centerTitle: true),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new address
          GoRouter.of(context).pushNamed(AppRouting.addAddress);
        },
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: addressesList.length,

        itemBuilder: (BuildContext context, int index) {
          final item = addressesList[index];
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
