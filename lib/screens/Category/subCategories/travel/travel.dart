import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/Bags.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/Suitcases.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/campinggear.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/otherstravelItem.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/roofracks.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/subcategories/travelaccerioes.dart';
class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  int   currentIndexTab=0;
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
                    Text("Travel and Luggage",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                    Icon(Icons.shopping_cart,color: Colors.black,)
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
                              'Suitcases',
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
                              'Bags',
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
                              'Camping Gear',
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
                              'Travel Accessories',
                              style: TextStyle(
                                  color: currentIndexTab==2? Colors.white:Colors.white,
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
                            currentIndexTab=4;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,

                          decoration: BoxDecoration(
                              color: currentIndexTab==4?  Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Roof Racks',
                              style: TextStyle(
                                  color: currentIndexTab==3? Colors.white:Colors.white,
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
                            currentIndexTab=5;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,

                          decoration: BoxDecoration(
                              color: currentIndexTab==5?  Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Other Travel Items',
                              style: TextStyle(
                                  color: currentIndexTab==4? Colors.white:Colors.white,
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
              currentIndexTab==0? Suitcases():Container(),
              currentIndexTab==1? Bags():Container(),
              currentIndexTab==2? CampingGear():Container(),
              currentIndexTab==3? TravelAccerioes():Container(),
              currentIndexTab==4? RoofRacks():Container(),
              currentIndexTab==5? OthersTravelItem():Container(),
            ],
          ),
        ),
      ),
    );
  }
}
