import 'package:flutter/material.dart';
import 'package:myrenthub/model/data_model.dart';

import '../../model/variable.dart';

class AddToCart extends StatefulWidget {
  final DataModel? data;

  AddToCart(this.data, {Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool addedToCart = false; // Track whether the item is added to the cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: cartList.length, // Replace yourDataList with the actual list of data
                itemBuilder: (BuildContext context, int index) {
                  //  cartList currentItem = [index]; // Replace YourDataType with the actual data type

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network(
                          cartList[index].imageURLs[0] ?? 'null',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cartList[index].title ?? 'null',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rs. ${ cartList[index].rent ?? 'null'}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

            ),
          ),
        ),
      ),
    );
  }

}

