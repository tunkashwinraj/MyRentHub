import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrenthub/admin/admin%20pannel.dart';
import 'package:myrenthub/admin/adminOffers.dart';
import 'package:myrenthub/admin/listings_screen.dart';
import 'package:myrenthub/lib2/lisitng%20admin/add_lisitng.dart';
import 'package:provider/provider.dart';
import 'package:myrenthub/auth/welcome_screen.dart';
import 'package:myrenthub/auth/provider/auth_provider.dart';
import 'package:myrenthub/auth/user_information_screen.dart';
import '../sellerauth/sellerAuth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.userId});
  final String? userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: 180,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(ap.userModel.profilePic),
                        radius: 40,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Account",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ap.userModel.phoneNumber,
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Renter Tools",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.black),
              title: Text("Add Listings", style: TextStyle(color: Colors.black)),
              onTap: () async {
                // Fetch user phone number
                String userPhoneNumber = ap.userModel.phoneNumber;

                // Navigate to add listing screen with user phone number
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdminPanel(),
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.list, color: Colors.black),
            //   title: Text("My Listings", style: TextStyle(color: Colors.black)),
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => ManageListingsPage(
            //           userId: widget.userId ?? '', // Provide a default value if null
            //         ),
            //       ),
            //     );
            //   },
            // ),

            ListTile(
              leading: Icon(Icons.menu, color: Colors.black),
              title: Text("View My Lisitngs", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page, color: Colors.black),
              title: Text("View My Requests", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.offline_bolt, color: Colors.black),
              title: Text("List Offers / Recommendations", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OfferS()));
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Other Information",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.black),
              title: Text("Share the app", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text("About Us", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.black),
              title: Text("Rate us on Play Store", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: Text("Notification preferences", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Support",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.black),
              title: Text("Contact Us", style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your functionality here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text("Logout", style: TextStyle(color: Colors.black)),
              onTap: () async {
                await ap.userSignOut();
                // Optionally navigate to login screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "MyRentHub",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
