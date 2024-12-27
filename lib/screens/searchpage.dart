import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myrenthub/model/data_model.dart';

import 'detailScreen/detailscreen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'Select';
  String selectedSubcategory = 'Select';
  String searchQuery = '';
  List<DataModel> data = [];
  List<DataModel> filteredData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection("Categories");

      if (selectedCategory != 'Select') {
        query = query.where("selectedOption", isEqualTo: selectedCategory);
      }
      if (selectedSubcategory != 'Select') {
        query =
            query.where("selectedSubOption", isEqualTo: selectedSubcategory);
      }
      if (searchQuery.isNotEmpty) {
        query = query.where("title", isGreaterThanOrEqualTo: searchQuery);
      }

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await query.get();

      data = querySnapshot.docs
          .map((doc) => DataModel.fromJson(doc.data()))
          .toList();

      setState(() {
        filteredData = data;
        isLoading = false;
      });
    } catch (e) {
      // Handle the error
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterData() {
    setState(() {
      filteredData = data
          .where((item) =>
              item.selectedOption == selectedCategory &&
              item.selectedSubOption == selectedSubcategory &&
              item.title.contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: [
                'Select',
                'Real Estate',
                'Vehicles',
                'Electronics',
                'Home Appliances',
                'Furniture',
                'Tools & Equipment',
                'Sports Equipment',
                'Party & Event Supplies',
                'Baby & Kids Gear',
                'Travel & Luggage',
                'Office Equipment',
                'Fashion Accessories',
                'Health & Fitness',
                'Kitchen Appliances',
                'Musical Instruments'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedCategory = value!;
                  fetchData();
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filterData();
                });
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? Center(
                      child: SpinKitWave(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(data[index]));
                          },
                          child: ListTile(
                            leading: Image.network(
                              filteredData[index].imageURLs.isNotEmpty
                                  ? filteredData[index].imageURLs[0]
                                  : '', // Display the first image
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(filteredData[index].title,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
