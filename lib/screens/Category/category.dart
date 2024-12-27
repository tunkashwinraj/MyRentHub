import 'package:flutter/material.dart';
import 'package:myrenthub/screens/Category/subCategories/babykidsgear/babykidsgear.dart';
import 'package:myrenthub/screens/Category/subCategories/electronic/electronics.dart';
import 'package:myrenthub/screens/Category/subCategories/fashionaccerioes/fashionAccerioes.dart';
import 'package:myrenthub/screens/Category/subCategories/furniturehomedecore/furniturehomedecore.dart';
import 'package:myrenthub/screens/Category/subCategories/healthfitness/healthFitness.dart';
import 'package:myrenthub/screens/Category/subCategories/homeappliences/homeappliences.dart';
import 'package:myrenthub/screens/Category/subCategories/kitchen/kitchen.dart';
import 'package:myrenthub/screens/Category/subCategories/musicallinstrument/musicalinstrument.dart';
import 'package:myrenthub/screens/Category/subCategories/officeequipment/officeEquipment.dart';
import 'package:myrenthub/screens/Category/subCategories/outdoorgear/outdoorGear.dart';
import 'package:myrenthub/screens/Category/subCategories/partyevent/partyevent.dart';
import 'package:myrenthub/screens/Category/subCategories/realestate/realestates/realestate.dart';
import 'package:myrenthub/screens/Category/subCategories/toolsequipment/toolsEquipment.dart';
import 'package:myrenthub/screens/Category/subCategories/travel/travel.dart';
import 'package:myrenthub/screens/Category/subCategories/vechicles/vechicles.dart';
import 'package:myrenthub/screens/cart/addtocart.dart';
import 'package:provider/provider.dart';

import '../../auth/provider/auth_provider.dart';


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);
  @override
  State<Category> createState() => _CategoryState();
}
class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 50,left: 30,right: 30,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Hey ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                        Text(ap.userModel.name,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  SizedBox(height: 20),
                    Text("Shop\nBy Category!",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.white,letterSpacing: 1.5),),
                    SizedBox(height: 25),
                    Text("All in One Rental Things",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.white,letterSpacing: 1.5),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RealEstate()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffFFDC83)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/realestate.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Real Estate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                            SizedBox(height: 10,),
                            Text("Your ideal home is just\na click away. Apartments,\nvillas, land, and more in the\nReal Estate category.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Vechicals()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFC3BB)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/vehicles.png"))),
                          ),
                        ),
                       SizedBox(width: 30,),
                        const Padding(
                          padding: EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Vehicles",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Explore a range of \ntransportation options in\nthe Vehicles category.\nWhether you're into bikes,\ncars,or unique vehicles,",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Electronics()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffA9B4BC)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/electronics and gadents.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Electronics &\nGadgets",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Discover the latest tech\nsmartphones, laptops,\ncameras,Explore Electronics",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAppliencies()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFC83A)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/home appliances.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Home Appliances",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 20,),
                              Text("The Home Appliances\ncategory offers convenience.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FurnitureHome()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff2A4BA0)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/funiture ad home decor.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        const Padding(
                          padding: EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Furniture &\nHome Decor",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Rent stylish furniture and\ndecor,from sofas to wall\nart,to transform your space\nwith ease",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ToolsEquipment()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff606D76)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/tools and equipments.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tools & Equipment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Unleash your DIY spirit\nwith our Tools and\nEquipment category.\nGet the job done with the\nright tools",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OutDoorGear()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffE7ECF0)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/outdoor geat and sports.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Outdoor Gear &\nSports Equipment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Gear up for adventure!\nRent camping, sports\nequipment bicycles,",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PartyEvent()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFDC83)
                            ),
                            child:Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/party and events supplies.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Party &\nEvent Supplies",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Elevate your events with\nrented party essentials\ntents, projectors, sound\nsystems,and more",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BabyKidsGear()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFC3BB)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/kids gear.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Baby & Kids' Gear",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Rent essential gear for\nyour little ones - cribs,\nstrollers, car seats,\nhigh chairs, and more.\nMake parenting easier",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Travel()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffA9B4BC)
                            ),
                            child:Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/travel and luggage.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Travel & Luggage",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Rent travel essentials\nsuitcases, bags, camping\ngear, accessories, and\nmore.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OfficeEquipment()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFC83A)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/office equipments.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Office Equipment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Optimize your workspace\nrent printers, scanners,\ndesks, chairs, and more\nfrom our Office Equipment\nselection. ",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FashionAsserioes()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff2A4BA0)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/fashion and accessories.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fashion &\nAccessories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Stay stylish with rented\nparty wear,designer\ndresses,accessories,\nand more.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthFitness()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff606D76)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/health and fitmess.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Health &\nFitness Equipment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Stay fit and healthy\nwith rented treadmills,\nexercise bikes, yoga mats,\nand more",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Kitchen()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffE7ECF0)
                            ),
                            child:Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/kitchen appliances.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        const Padding(
                          padding: EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kitchen Appliances &\nUtensils",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Elevate your cooking\ngame with rented blenders,\ncoffee machines,\nand more.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 167,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MusicalInstrument()));
                          },
                          child: Container(
                            height: 167,
                            width: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffFFC3BB)
                            ),
                            child: Center(child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset("images/musical instruments.png"))),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Musical Instruments",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text("Rock out with rented\nguitars, keyboards, drums,\nand more. Find your musical\ngroove in our Musical\nInstruments category.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize:14),)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 35,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
