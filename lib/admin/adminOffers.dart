import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class OfferS extends StatefulWidget {
  const OfferS({Key? key}) : super(key: key);

  @override
  State<OfferS> createState() => _OfferSState();
}

class _OfferSState extends State<OfferS> {
  final TextEditingController title = TextEditingController();
  final TextEditingController littledescription = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController phoneno = TextEditingController();
  final TextEditingController rent = TextEditingController();

  late ImagePicker _imagePicker;
  XFile? _image;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final RxString selectedValue = 'Offers'.obs;
  final List<String> options = ['Offers', 'Reccomended'];

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<void> _uploadData() async {
    if (_image == null ||
        companyName.text.isEmpty ||
        phoneno.text.isEmpty ||
        title.text.isEmpty ||
        littledescription.text.isEmpty ||
        rent.text.isEmpty ||
        description.text.isEmpty) {
      // Show a GetX Snackbar if any of the required fields are empty
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    // Upload image to Firebase Storage
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask task = storage.ref('images/$imageName.jpg').putFile(File(_image!.path));

    // Get the download URL of the uploaded image
    String imageUrl = await (await task).ref.getDownloadURL();

    // Create a map of data to be stored in Firestore
    Map<String, dynamic> data = {
      'companyName': companyName.text,
      'phoneno': phoneno.text,
      'title': title.text,
      'littledescription': littledescription.text,
      'rent': rent.text,
      'description': description.text,
      'category': selectedValue.value,
      'imageUrl': imageUrl,
    };

    // Add data to Firestore
    await firestore.collection('offers').add(data);

    // Clear the form after submission
    _clearForm();

    // Show a GetX Snackbar for successful submission
    Get.snackbar('Success', 'Data submitted successfully');
  }

  void _clearForm() {
    setState(() {
      _image = null;
      companyName.clear();
      phoneno.clear();
      title.clear();
      littledescription.clear();
      rent.clear();
      description.clear();
      selectedValue.value = 'Offers';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _getImage,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[300],
                  child: _image == null
                      ? Center(child: Text('select image'))
                      : Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: companyName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CompanyName',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneno,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Little Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: littledescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Little Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: rent,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'RentPerDay',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 4,
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the color of the border
                    width: 2.0,          // Set the width of the border
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: DropdownButton(
                    value: selectedValue.value,
                    items: options.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedValue.value = value!;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _uploadData,
                  child: Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

