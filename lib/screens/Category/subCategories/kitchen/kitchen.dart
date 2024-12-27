import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/airFaryes.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/blenders.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/chefknife.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/coffemachines.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/foodprocessor.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/otheritem.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/subcategory/slowcookers.dart';
class Kitchen extends StatefulWidget {
  const Kitchen({Key? key}) : super(key: key);

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
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
                    Text("Kitchen Appliances and Utensils",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
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
                              'Blenders',
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
                              'Food Processors',
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
                              'Coffee Machines',
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
                              'Air Fryers',
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
                              'Slow Cookers',
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
                              'Chef Knife',
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
                              'Other Items',
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
              currentIndexTab==0? Blenders():Container(),
              currentIndexTab==1? FoodProcessor():Container(),
              currentIndexTab==2? CoffeMachines():Container(),
              currentIndexTab==3? AirFaryes():Container(),
              currentIndexTab==4? SlowCookers():Container(),
              currentIndexTab==5? ChefKnife():Container(),
              currentIndexTab==6? Otheritem():Container(),
            ],
          ),
        ),
      ),
    );
  }
}