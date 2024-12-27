import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:myrenthub/auth/provider/auth_provider.dart';
import 'package:myrenthub/model/offersModel.dart';
import 'package:myrenthub/screens/Faq.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> dataFuture;
  List<OffersModel> recommendedProducts = [];
  List<OffersModel> offerProducts = [];
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> recommendedSnapshot =
      await FirebaseFirestore.instance
          .collection("offers")
          .where("category", isEqualTo: "Recommended")
          .get();

      final QuerySnapshot<Map<String, dynamic>> offerSnapshot =
      await FirebaseFirestore.instance
          .collection("offers")
          .where("category", isEqualTo: "Offers")
          .get();

      recommendedProducts = recommendedSnapshot.docs
          .map((doc) => OffersModel.fromJson(doc.data()))
          .toList();

      offerProducts = offerSnapshot.docs
          .map((doc) => OffersModel.fromJson(doc.data()))
          .toList();

      setState(() {
        // Update UI with fetched data
        recommendedProducts;
        offerProducts;
      });

      print("Found recommended products: ${recommendedProducts.length}");
      print("Found offer products: ${offerProducts.length}");
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Faq()),
                );
              },
              child: ListTile(
                title: Text(
                  "Faq",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Search",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  // Logout Logic
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 30,
                  right: 30,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hey ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ap.userModel.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () => scaffoldKey.currentState!.openDrawer(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "search Product and store",
                          hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                        ),
                        onChanged: (val) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Save time by creating, quoting, and invoicing bookings with an all-in-one platform built for rentals.",
                      style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedProducts.length,
                      itemBuilder: (context, index) {
                        return buildProductCard(recommendedProducts[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Offers",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offerProducts.length,
                      itemBuilder: (context, index) {
                        return buildProductCard(offerProducts[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(20),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LOOKING FOR A PARTICULAR PRODUCT"),
                    TextField(
                      onChanged: (value) {
                        // Do something with the entered text
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Upload entered data to Firestore
                        FirebaseFirestore.instance.collection('suggestion').add({
                          'product': 'Suggested Product',
                        }).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Data uploaded successfully'),
                          ));
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Failed to upload data: $error'),
                          ));
                        });
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildProductCard(OffersModel product) {
    return InkWell(
      onTap: () {
        // Handle product tap
      },
      child: Container(
        height: 200,
        width: 138,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                child: Center(
                  child: Image.network(product.imageUrl ?? ''),
                ),
              ),
              Divider(color: Colors.black),
              Text(
                product.title ?? '',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                product.description ?? '',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.grey),
              ),
              Spacer(),
              Container(
                height: 24,
                width: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "Rent Per/Day",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff2A4BA0), // Corrected color value
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

