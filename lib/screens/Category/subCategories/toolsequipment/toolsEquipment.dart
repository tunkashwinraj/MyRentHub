import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/gardingtools.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/otherstools.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/paintingequipment.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/passurewasher.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/powertools.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/subcategory/woodworkingtools.dart';
class ToolsEquipment extends StatefulWidget {
  const ToolsEquipment({Key? key}) : super(key: key);

  @override
  State<ToolsEquipment> createState() => _ToolsEquipmentState();
}

class _ToolsEquipmentState extends State<ToolsEquipment> {
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
                  Text("Tools and Equipment",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24),),
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
                            'Power Tools',
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
                            'Gardening Tools',
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
                            'PressureWasher',
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
                            'WoodworkingTools',
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
                            'PaintingEquipment',
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
                            'Other Tools',
                            style: TextStyle(
                                color: currentIndexTab==4? Colors.white:Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),

                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            currentIndexTab==0? PowerTools():Container(),
            currentIndexTab==1? GardingTools():Container(),
            currentIndexTab==2?  PassureWasher():Container(),
            currentIndexTab==3? WoodWorkingTools():Container(),
            currentIndexTab==4? PaintingEquipment():Container(),
            currentIndexTab==5? OthersTools():Container(),

          ],
        ),
      ),
    );
  }
}
