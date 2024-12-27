import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/airconditioner.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/microwaves.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/othersappliences.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/refrigerators.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/vacumcleaner.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/subcategories/washingmachines.dart';
class HomeAppliencies extends StatefulWidget {
  const HomeAppliencies({Key? key}) : super(key: key);

  @override
  State<HomeAppliencies> createState() => _HomeApplienciesState();
}

class _HomeApplienciesState extends State<HomeAppliencies> {
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
                  Text("Home Appliances",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24),),
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
                            'Refrigerators',
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
                            'WashingMachines',
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
                            'Microwaves',
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
                            'Air Conditioners',
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
                            'Vacuum Cleaners',
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
                            'Other Appliances',
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
            currentIndexTab==0? Refrigerators():Container(),
            currentIndexTab==1? WashingMachines():Container(),
            currentIndexTab==2? Microwaves():Container(),
            currentIndexTab==3? Airconditioner():Container(),
            currentIndexTab==4? VacumCleaner():Container(),
            currentIndexTab==5? OthersAppliences():Container(),
          ],
        ),
      ),
    );
  }
}
