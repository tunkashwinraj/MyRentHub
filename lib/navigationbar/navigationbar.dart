import 'package:flutter/material.dart';
import 'package:myrenthub/model/data_model.dart';
import 'package:myrenthub/screens/Category/category.dart';
import 'package:myrenthub/screens/cart/addtocart.dart';
import 'package:myrenthub/screens/cart/cart.dart';
import 'package:myrenthub/screens/homePage.dart';
import 'package:myrenthub/auth/home_screen.dart';


import '../screens/searchpage.dart';
import '../screens/wishlist.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MaterialYou extends StatefulWidget {
  const MaterialYou({Key? key}) : super(key: key);

  @override
  State<MaterialYou> createState() => _MaterialYouState();
}

class _MaterialYouState extends State<MaterialYou> {
  int _currentIndex = 0;
  List<DataModel> dataList = []; // Your data initialization here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.black,
          backgroundColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Colors.white),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.
              search, color: Colors.white),
              icon: Icon(Icons.search),
              label: 'search',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.category, color: Colors.white),
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite, color: Colors.white),
              icon: Icon(Icons.favorite_border,color: Colors.black,),
              label: 'favorite',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: Colors.white),
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
  DataModel? data;
  List<Widget> get pages => [
    HomePage(),
    SearchPage(),
    Category(),
    CartPage(),
    HomeScreen(),
  ];
}
