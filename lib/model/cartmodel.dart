import 'data_model.dart';

class CartItem {
  final DataModel data;

  CartItem({required this.data});
}

class CartModel {
  List<CartItem> items = [];

  void addToCart(DataModel data) {
    items.add(CartItem(data: data));
  }

  void removeFromCart(CartItem item) {
    items.remove(item);
  }
}

final cartModel = CartModel();
