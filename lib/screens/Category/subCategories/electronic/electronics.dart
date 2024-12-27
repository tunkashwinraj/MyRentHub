import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/Laptops.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/camcoders.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/camers.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/drone.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/others.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/smartphones.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/tablets.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/subCategories/vrheadsets.dart';
class Electronics extends StatefulWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  int   currentIndexTab=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  Text("Electronics and Gadgets",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24),),
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
                            'Smartphones',
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
                            'Laptops',
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
                            'Tablets',
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
                            'Cameras',
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
                            'Camcorders',
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
                            'Drones',
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
                            'VR Headsets',
                            style: TextStyle(
                                color: currentIndexTab==5? Colors.white:Colors.white,
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
                          currentIndexTab=7;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 103,

                        decoration: BoxDecoration(
                            color: currentIndexTab==7?  Color(0xff03436E):Color(0xff1F90DB),
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Other Electronics',
                            style: TextStyle(
                                color: currentIndexTab==6? Colors.white:Colors.white,
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
            currentIndexTab==0? SmartPhones():Container(),
            currentIndexTab==1? Laptops():Container(),
            currentIndexTab==2? Tablets():Container(),
            currentIndexTab==3? Camers():Container(),
            currentIndexTab==4? CamCoders():Container(),
            currentIndexTab==5? Drones():Container(),
            currentIndexTab==6? VrHeadsets():Container(),
            currentIndexTab==7? OthersElectronic():Container(),
          ],
        ),
      ),
    );
  }
}
