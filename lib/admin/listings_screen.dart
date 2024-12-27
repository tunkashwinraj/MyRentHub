import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myrenthub/admin/admin%20pannel.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  late Future<List<Map<String, dynamic>>> _futureListings;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _futureListings = _fetchListings();
  }

  Future<List<Map<String, dynamic>>> _fetchListings() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception('User not logged in');
      }

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Categories')
          .where('ownerId', isEqualTo: uid) // Filter by ownerId
          .get();

      List<Map<String, dynamic>> listings = querySnapshot.docs
          .map((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
          .toList();

      setState(() {
        _isLoading = false;
      });
      return listings;
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      return [];
    }
  }

  Future<void> _deleteListing(String docId, String ownerId) async {
    // Check if the current user is the owner of the listing
    if (FirebaseAuth.instance.currentUser?.uid != ownerId) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You are not authorized to delete this listing.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('Categories').doc(docId).delete();
      // Refresh the listings
      setState(() {
        _futureListings = _fetchListings();
      });
    } catch (e) {
      // Handle error
      print('Error deleting listing: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listings'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hasError
          ? Center(child: Text('Error fetching listings. Please try again.'))
          : FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureListings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching listings. Please try again.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No listings found.'));
          } else {
            List<Map<String, dynamic>> listings = snapshot.data!;
            return ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, index) {
                var listing = listings[index];
                return ListTile(
                  title: Text(listing['title'] ?? 'No Title'),
                  subtitle: Text(listing['description'] ?? 'No Description'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Confirm and delete the listing
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirm'),
                            content: Text('Are you sure you want to delete this listing?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _deleteListing(listing['id'], listing['ownerId']); // Pass ownerId for verification
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminPanel()), // Navigate to AdminPanel
          ).then((_) {
            // Refresh listings when returning from AdminPanel
            setState(() {
              _futureListings = _fetchListings();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
