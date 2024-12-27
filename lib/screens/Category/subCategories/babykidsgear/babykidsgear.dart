import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/Cribs.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/Strollers.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/babymonitors.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/carSeats.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/highchairs.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/otherskidsgear.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/subcategory/playseats.dart';
class BabyKidsGear extends StatefulWidget {
  const BabyKidsGear({Key? key}) : super(key: key);

  @override
  State<BabyKidsGear> createState() => _BabyKidsGearState();
}

class _BabyKidsGearState extends State<BabyKidsGear> {
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
                    Text("Baby and Kids' Gear",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                    Icon(Icons.shopping_cart,color: Colors.black,)
                  ],
                ),
              ),
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
                              'Cribs',
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
                              'Strollers',
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
                              'Car Seats',
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
                              'High Chairs',
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
                              'Baby Monitors',
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
                              'Playsets',
                              style: TextStyle(
                                  color: currentIndexTab==4? Colors.white:Colors.white,
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
                            currentIndexTab=6;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 103,

                          decoration: BoxDecoration(
                              color: currentIndexTab==6?  Color(0xff03436E):Color(0xff1F90DB),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                            child: Text(
                              'Other Kids Gear',
                              style: TextStyle(
                                  color: currentIndexTab==5? Colors.white:Colors.white,
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
              currentIndexTab==0? Cribs():Container(),
              currentIndexTab==1? Strollers():Container(),
              currentIndexTab==2? CarSeats():Container(),
              currentIndexTab==3? HighChairs():Container(),
              currentIndexTab==4? BabyMonitors():Container(),
              currentIndexTab==5? PlaySeats():Container(),
              currentIndexTab==6? OthersKidsGear():Container(),

            ],
          ),
        ),
      ),
    );
  }
}
