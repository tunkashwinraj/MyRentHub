import 'package:get/get.dart';
import 'package:myrenthub/model/data_model.dart';

class MyCartController extends GetxController {
  RxList<DataModel> cartItems = <DataModel>[].obs;

  void addToCart(DataModel dataModel) {
    cartItems.add(dataModel);
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
  }
}
