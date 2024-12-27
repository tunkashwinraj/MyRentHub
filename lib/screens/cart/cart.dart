import 'package:flutter/material.dart';
import 'package:myrenthub/model/data_model.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/appartments.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: favorite.isEmpty
          ? Center(
        child: Text('Your cart is empty.'),
      )
          : ListView.builder(
        shrinkWrap: true,
        itemCount: favorite.length,
        itemBuilder: (context, index) {
          final item = favorite[index];

          return ListTile(
            leading: Image.network(
              item.imageURLs[0] ?? '',
              height: 40,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text(item.title ?? 'Product Title'),
            subtitle: Text('Rs. ${item.rent ?? 'null'}'),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                removeFromCart(index);
              },
            ),
          );
        },
      ),
    );
  }

  void removeFromCart(int index) {
    setState(() {
      favorite.removeAt(index);
    });
    _updateFavorites();
  }

  void _updateFavorites() async {
    final List<String> favoriteList = favorite.map((item) {
      return {
        'title': item.title,
        'imageUrl': item.imageURLs.isNotEmpty ? item.imageURLs[0] : null,
        'rent': item.rent,
      }.toString();
    }).toList();
    await _prefs.setStringList('favorites', favoriteList);
  }

}
