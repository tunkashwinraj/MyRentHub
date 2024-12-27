import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/appartments.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/land.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/otherproperties.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/villas.dart';
import 'package:myrenthub/screens/cart/addtocart.dart';

import '../../../../../model/data_model.dart';
import '../../../../cart/cart.dart';
class RealEstate extends StatefulWidget {
  const RealEstate({Key? key}) : super(key: key);

  @override
  State<RealEstate> createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  int   currentIndexTab=0;
  List<DataModel> data = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Color(0xffE7ECF0),
                          child: Icon(Icons.arrow_back,color: Colors.black,),
                        ),
                      ),
                       Text("Real Estate",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24),),
                      InkWell(
                          onTap: (){
                         Get.to(CartPage(),);
                          },
                          child: Icon(Icons.favorite,color: Colors.black,))
                    ],
                  ),
                ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndexTab =0;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: currentIndexTab==0?   Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Apartments',
                              maxLines: 1,
                              style: TextStyle(
                                  color:  currentIndexTab==0? Colors.white:Colors.white,

                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndexTab =1;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: currentIndexTab==1?   Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Villas',
                              maxLines: 1,
                              style: TextStyle(
                                  color:  currentIndexTab==0? Colors.white:Colors.white,

                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndexTab =2;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: currentIndexTab==2?  Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Land',
                              style: TextStyle(
                                  color: currentIndexTab==1? Colors.white:Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndexTab=3;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,

                          decoration: BoxDecoration(
                              color: currentIndexTab==3?  Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Other Properties',
                              style: TextStyle(
                                  color: currentIndexTab==2? Colors.white:Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),
              currentIndexTab==0? Apartments():Container(),
              currentIndexTab==1? Villas():Container(),
              currentIndexTab==2? Lands():Container(),
              currentIndexTab==3? OtherProperties():Container(),
            ],
          ),
        ),
      ),
    );
  }
}
