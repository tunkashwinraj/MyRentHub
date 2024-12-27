import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/data_model.dart';
import 'detailScreen/detailscreen.dart';

class YourPage extends StatefulWidget {
  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  late List<DataModel> data = [];
  late List<bool> isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      String userEmail = currentUser.email ?? '';
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Categories')
          .where('userEmail', isEqualTo: userEmail)
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<DataModel> newData = snapshot.docs.map((doc) {
          return DataModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        setState(() {
          data = newData;
          isFavoriteList = List.generate(newData.length, (index) => false);
        });
      } else {
        print('No documents found for the current user.');
      }
    }
  }
  void deleteProduct(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  // void deleteProduct(int index) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? currentUser = auth.currentUser;
  //   if (currentUser != null) {
  //     String userEmail = currentUser.email ?? '';
  //     await FirebaseFirestore.instance
  //         .collection('Categories')
  //         .doc(data[index].documentId) ,
  //       .delete();
  //   setState(() {
  //   data.removeAt(index);
  //   });
  // }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(DetailsScreen(data[index]));
                      },
                      child: data[index].imageURLs != null
                          ? Container(
                        height: 75,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Image.network(
                          data[index].imageURLs[0],
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text('Image not available'),
                            );
                          },
                        ),
                      )
                          : Center(
                        child: Text('Image not available'),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Text(
                      data[index].title!,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      data[index].littleDescription ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 14, color: Colors.grey),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Show confirmation dialog before deletion
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Deletion'),
                              content:
                              Text('Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    deleteProduct(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 24,
                        width: 158,
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
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xff2A4BA0),
                                ),
                                child: Icon(Icons.more_vert_sharp,
                                    color: Colors.white, size: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


