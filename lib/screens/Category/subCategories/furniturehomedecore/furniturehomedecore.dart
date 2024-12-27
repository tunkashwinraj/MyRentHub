import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/bedframes.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/chairs.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/coffetabel.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/diningtabels.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/matteres.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/otherfurntinure.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/sofas.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/subCategory/wallart.dart';
class FurnitureHome extends StatefulWidget {
  const FurnitureHome({Key? key}) : super(key: key);

  @override
  State<FurnitureHome> createState() => _FurnitureHomeState();
}

class _FurnitureHomeState extends State<FurnitureHome> {
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
                  Text("Furniture and Home Decors",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24),),
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
                            'Sofas',
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
                            'Dining Tables',
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
                            'Chairs',
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
                            'Bed Frames',
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
                            'Mattresses',
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
                            'Coffee Tables',
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
                            'Wall Art',
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
                            'Other Furniture',
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
            currentIndexTab==0? Sofas():Container(),
            currentIndexTab==1? DiningTabels():Container(),
            currentIndexTab==2? Chairs():Container(),
            currentIndexTab==3? BedFrames():Container(),
            currentIndexTab==4? Matteres():Container(),
            currentIndexTab==5? CoffeTabel():Container(),
            currentIndexTab==6? WallArt():Container(),
            currentIndexTab==7? OtherFurntinure():Container(),
          ],
        ),
      ),
    );
  }
}

