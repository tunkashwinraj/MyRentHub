import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrenthub/admin/admin%20pannel.dart';
import 'package:myrenthub/admin/adminOffers.dart';
class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
            children: [
             Container(
                 height: 200,
                 child: Image.asset("images/logo.png")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get..to(AdminPanel());
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff2A4BA0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category,color: Colors.white,),
                            SizedBox(height: 10,),
                            Text("Categories",style: TextStyle(
                              color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get..to(OfferS());
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff2A4BA0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.production_quantity_limits,color: Colors.white,),
                            SizedBox(height: 10,),
                            Text("Offers &\nReccomended",style: TextStyle(
                                color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  // Get..to(AdminPanel());
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff2A4BA0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.update,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Upcoming",style: TextStyle(
                            color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
      ),
          ),
       ),
    );
  }
}
