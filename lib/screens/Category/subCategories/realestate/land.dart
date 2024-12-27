import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../model/data_model.dart';
import '../../../detailScreen/detailscreen.dart';
List<DataModel> favorite = [];
class Lands extends StatefulWidget {
  const Lands({Key? key}) : super(key: key);

  @override
  State<Lands> createState() => _LandsState();
}

class _LandsState extends State<Lands> {
  late Future<void> dataFuture;
  List<DataModel> data = [];
  List<bool> isFavoriteList = [];

  @override
  void initState() {
    dataFuture = getData();
    super.initState();
  }

  Future<void> getData() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection("Categories")
          .where("selectedRealEstateOption", isEqualTo: "Land")
          .get();

      data = querySnapshot.docs
          .map((doc) => DataModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 500,
              child: Center(
                child: SpinKitWave(
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading data'),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child:  GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in a row
                crossAxisSpacing: 8.0, // Spacing between items horizontally
                mainAxisSpacing: 8.0, // Spacing between items vertically
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, bottom: 8),
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
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: SpinKitWave(
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (context, error, stackTrace) {
                                // If an error occurs while loading the image, show a message
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          data[index].littleDescription ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Container(
                          height: 26,
                          width: double.infinity,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFavoriteList[index]) {
                                          favorite.remove(data[index]);
                                        } else {
                                          bool isAlreadyFavorite =
                                          favorite.contains(data[index]);
                                          if (!isAlreadyFavorite) {
                                            favorite.add(data[index]);
                                          }
                                        }
                                        isFavoriteList[index] =
                                        !isFavoriteList[index];
                                      });
                                    },
                                    child: Icon(
                                      isFavoriteList[index]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
