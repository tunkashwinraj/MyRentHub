import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AddListingScreen extends StatefulWidget {
  final String userPhoneNumber;

  const AddListingScreen({Key? key, required this.userPhoneNumber}) : super(key: key);

  @override
  _AddListingScreenState createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController littledescriptionController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController rentController = TextEditingController();

  late ImagePicker _imagePicker;
  XFile? _image;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final RxString selectedCategory = 'Offers'.obs;
  final List<String> categories = ['Offers', 'Recommended'];

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

  Future<void> _uploadListing() async {
    if (_image == null ||
        titleController.text.isEmpty ||
        littledescriptionController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        companyNameController.text.isEmpty ||
        phoneNoController.text.isEmpty ||
        rentController.text.isEmpty) {
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
      'userPhoneNumber': widget.userPhoneNumber,
      'title': titleController.text,
      'littledescription': littledescriptionController.text,
      'description': descriptionController.text,
      'companyName': companyNameController.text,
      'phoneNo': phoneNoController.text,
      'rent': rentController.text,
      'category': selectedCategory.value,
      'imageUrl': imageUrl,
      'timestamp': Timestamp.now(),
    };

    // Add data to Firestore
    await firestore.collection('offers').add(data);

    // Clear the form after submission
    _clearForm();

    // Show a GetX Snackbar for successful submission
    Get.snackbar('Success', 'Listing added successfully');
  }

  void _clearForm() {
    setState(() {
      _image = null;
      titleController.clear();
      littledescriptionController.clear();
      descriptionController.clear();
      companyNameController.clear();
      phoneNoController.clear();
      rentController.clear();
      selectedCategory.value = 'Offers';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Listing'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _getImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _image == null
                    ? Center(child: Text('Tap to add image'))
                    : Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: littledescriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Little Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: companyNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Company Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneNoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: rentController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Rent Per Day',
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton(
                  value: selectedCategory.value,
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    selectedCategory.value = value!;
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _uploadListing,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
