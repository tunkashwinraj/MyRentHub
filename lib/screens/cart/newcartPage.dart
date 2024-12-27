import 'package:flutter/material.dart';
import '../../../../model/data_model.dart';

class CartPage extends StatelessWidget {
  final List<DataModel> items; // Change to List<DataModel>

  const CartPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return your cart page UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title ?? ''),
            subtitle: Text(item.littleDescription ?? ''),
            // Add more item details as needed
          );
        },
      ),
    );
  }
}
