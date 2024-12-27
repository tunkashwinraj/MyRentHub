import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



//////////////////
class ManageListingsPage extends StatefulWidget {
  final String userId;

  ManageListingsPage({required this.userId});

  @override
  _ManageListingsPageState createState() => _ManageListingsPageState();
}

class _ManageListingsPageState extends State<ManageListingsPage> {
  late Future<List<Listing>> _listings;

  @override
  void initState() {
    super.initState();
    _listings = fetchListings(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Listings'),
      ),
      body: FutureBuilder<List<Listing>>(
        future: _listings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No listings found.'));
          } else {
            final listings = snapshot.data!;
            return ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, index) {
                final listing = listings[index];
                return ListTile(
                  title: Text(listing.name),
                  subtitle: Text(listing.description),
                  trailing: Text('\$${listing.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditListingPage(listing: listing),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<Listing>> fetchListings(String userId) async {
  try {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('listings')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => Listing.fromFirestore(doc)).toList();
  } catch (e) {
    print('Error fetching listings: $e'); // Print the error
    throw e; // Re-throw the exception to handle it in the FutureBuilder
  }
}



class Listing {
  String id;
  String name;
  String description;
  double price;

  Listing({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Listing.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Listing(
      id: doc.id,
      name: data['name'] ?? '', // Provide default values if needed
      description: data['description'] ?? '',
      price: data['price']?.toDouble() ?? 0.0, // Ensure price is a double
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }
}

class EditListingPage extends StatefulWidget {
  final Listing listing;

  EditListingPage({required this.listing});

  @override
  _EditListingPageState createState() => _EditListingPageState();
}

class _EditListingPageState extends State<EditListingPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late double _price;

  @override
  void initState() {
    super.initState();
    _name = widget.listing.name;
    _description = widget.listing.description;
    _price = widget.listing.price;
  }

  Future<void> _updateListing() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final updatedListing = Listing(
        id: widget.listing.id,
        name: _name,
        description: _description,
        price: _price,
      );

      await FirebaseFirestore.instance
          .collection('listings')
          .doc(updatedListing.id)
          .update(updatedListing.toMap());

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                initialValue: _price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updateListing,
                child: Text('Update Listing'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
