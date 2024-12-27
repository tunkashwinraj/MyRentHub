import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../model/data_model.dart';
import '../../../../cart/addtocart.dart';
import '../../../../detailScreen/detailscreen.dart';
class OthersOfficeEqui extends StatefulWidget {
  const OthersOfficeEqui({Key? key}) : super(key: key);

  @override
  State<OthersOfficeEqui> createState() => _OthersOfficeEquiState();
}

class _OthersOfficeEquiState extends State<OthersOfficeEqui> {
  List<DataModel> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    try {
      data.clear();
      setState(() {});
      FirebaseFirestore.instance.collection("Categories").where("selectOfficeEquipment", isEqualTo: "OthersOfficeEqui").snapshots().listen((event) {

        data.clear();
        setState(() {});
        for (int i = 0; i < event.docs.length; i++) {
          DataModel dataModel = DataModel.fromJson(event.docs[i].data());
          data.add(dataModel);
        }
        setState(() {});
      });
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 10,right: 10,bottom: 20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
          crossAxisSpacing: 8.0, // Spacing between items horizontally
          mainAxisSpacing: 8.0, // Spacing between items vertically
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(

            width: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(DetailsScreen(data[index]));
                    },
                    child: Center(
                      child: data[index].imageURLs != null
                          ? Image.network(
                        data[index].imageURLs[0],
                        height: 60,
                        width: 100,
                        fit: BoxFit.fill,
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
                      )
                          : Center(
                        child: Text('Image not available'),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  Text(
                    data[index].title!,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(
                    data[index].littleDescription ?? "",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.grey),
                  ),
                  Spacer(),
                  Container(
                    height: 24,
                    width: 158,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: (){
                          Get.to(AddToCart(data[index]));
                        },
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
                                color: Color(0xff2A4BA0),
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 14),
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

    );

  }
}
