import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/ellipticals.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/exculsivebike.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/massagechairs.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/otherfashion.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/treadmills.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/weightlifting.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/subcategory/yogaMats.dart';
class HealthFitness extends StatefulWidget {
  const HealthFitness({Key? key}) : super(key: key);

  @override
  State<HealthFitness> createState() => _HealthFitnessState();
}

class _HealthFitnessState extends State<HealthFitness> {
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
                    Text("Health and Fitness Equipment",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
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
                              'Treadmills',
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
                              'Ellipticals',
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
                              'Exercise Bikes',
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
                              'Yoga Mats',
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
                              'Weightlifting',
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
                              'Massage Chairs',
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
                              'Other Fitness Gear',
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
              currentIndexTab==0?Treadmills():Container(),
              currentIndexTab==1? Ellipticals():Container(),
              currentIndexTab==2? ExculsiveBike():Container(),
              currentIndexTab==3? YogaMats():Container(),
              currentIndexTab==4? WeightLifting():Container(),
              currentIndexTab==5? MassageChairs():Container(),
              currentIndexTab==6? OtherFashionGear():Container(),
            ],
          ),
        ),
      ),
    );
  }
}
