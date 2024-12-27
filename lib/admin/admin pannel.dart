import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart'; // Import Firestore
import 'package:path/path.dart' as Path;

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController title = TextEditingController();
  TextEditingController littledescription = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController rent = TextEditingController();
  TextEditingController email = TextEditingController();
  String? userEmail;
  String selectedOption = 'Select';
  String selectedRealEstateOption = 'Select';
  String selectVachicle = 'Select';
  String selectElectronics = 'Select';
  String selectHomeAppliences = 'Select';
  String selectHomeFurniture = 'Select';
  String selectToolsEquipment = 'Select';
  String selectSportsEquipment = 'Select';
  String selectPartyEventSupplies = 'Select';
  String selectBabyKidsGear = 'Select';
  String selectTravelLuggage = 'Select';
  String selectOfficeEquipment = 'Select';
  String selectFashionAccerioes = 'Select';
  String selectHeathFitness = 'Select';
  String selectKitchenAppliences = 'Select';
  String selectMusicalInstruments = 'Select';
  String selectedSubOption = 'Select';

  UploadTask? task;
  bool isLoadFile = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String? fireUrlForImage;
  File? imageFile;

  List<File> selectedImages = [];

  getFromCamera() async {
    int remainingImages = 5 - selectedImages.length;
    while (remainingImages > 0) {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          selectedImages.add(File(pickedFile.path));
          remainingImages--;
        });
      } else {
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserEmail();
  }
  void fetchUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email;
      });
    } else {
      // User is not logged in
    }
  }
  Future<void> _submitDataToFirestore() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      List<String> imageURLs = [];
      for (File image in selectedImages) {
        String url = await uploadFile(image);
        imageURLs.add(url);
      }

      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception('User not logged in');
      }

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference dataCollection = firestore.collection('Categories');
      DocumentReference newDocument = await dataCollection.add({
        'title': title.text,
        'littledescription': littledescription.text,
        'description': description.text,
        'companyName': companyName.text,
        'rent': rent.text,
        'userEmail': userEmail ?? '',
        'phoneno': phoneno.text,
        'selectedOption': selectedOption,
        'selectedSubOption': selectedSubOption,
        'imageURLs': imageURLs,
        'selectedRealEstateOption': selectedRealEstateOption,
        'selectVachicle': selectVachicle,
        'selectElectronics': selectElectronics,
        'selectHomeAppliences': selectHomeAppliences,
        'selectHomeFurniture': selectHomeFurniture,
        'selectToolsEquipment': selectToolsEquipment,
        'selectSportsEquipment': selectSportsEquipment,
        'selectPartyEventSupplies': selectPartyEventSupplies,
        'selectBabyKidsGear': selectBabyKidsGear,
        'selectTravelLuggage': selectTravelLuggage,
        'selectOfficeEquipment': selectOfficeEquipment,
        'selectFashionAccerioes': selectFashionAccerioes,
        'selectHeathFitness': selectHeathFitness,
        'selectKitchenAppliences': selectKitchenAppliences,
        'selectMusicalInstruments': selectMusicalInstruments,
        'ownerId': uid, // Add the ownerId field here
      });

      String documentId = newDocument.id;
      print('Generated document ID: $documentId');

      setState(() {
        title.clear();
        littledescription.clear();
        description.clear();
        companyName.clear();
        phoneno.clear();
        rent.clear();
        selectedSubOption = 'Select';
        selectedOption = 'Select';
        selectedRealEstateOption = 'Select';
        selectedImages.clear();
        Get.snackbar('My RentHub', 'Data submitted successfully!');
      });
    } catch (e) {
      print('Error submitting data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting data. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }




  Future<String> uploadFile(File file) async {
    try {
      final fileName = Path.basename(file.path);
      final destination = 'files/$fileName';

      UploadTask task = FirebaseApi.uploadFile(destination, file);
      if (task == null) {
        throw Exception('Error uploading file');
      }

      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      return urlDownload;
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('Error uploading file');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: imageFile == null
                      ? ElevatedButton(
                    onPressed: getFromCamera,
                    child: Text("Pick Image"),
                  )
                      : Image.file(File(imageFile!.path)),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: selectedImages.length,
                  itemBuilder: (context, index) {
                    return Image.file(selectedImages[index]);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  //controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: userEmail,
                    labelText: userEmail,
                    border: OutlineInputBorder(),
                  ),
                  initialValue: userEmail ?? '',
                  readOnly: true,
                ),

                SizedBox(height: 10),
                TextFormField(
                  controller: companyName,
                  decoration: InputDecoration(
                    hintText: "Company name",
                    label: Text("Company Name"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Company name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: phoneno,
                  decoration: InputDecoration(
                    hintText: "phone No",
                    label: Text("phone No"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: "Title",
                    label: Text("Title"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: littledescription,
                  decoration: InputDecoration(
                    hintText: "Little description",
                    label: Text("Little Description"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Little description is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: rent,
                  decoration: InputDecoration(
                    hintText: "RentPerDay",
                    labelText: "Rent Per Day",
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Rent Per Day is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),
                TextFormField(
                  maxLines: 4,
                  controller: description,
                  decoration: InputDecoration(
                    hintText: "Description",
                    label: Text("Description"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedOption,
                  items: <String>[
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
                      selectedOption = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Category',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == 'Select') {
                      return 'Category is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                if (selectedOption == 'Real Estate')
                  DropdownButtonFormField<String>(
                    value: selectedRealEstateOption,
                    items: <String>[
                      'Select',
                      'apartment',
                      'Villa',
                      'Land',
                      'Others'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedRealEstateOption = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Vehicles')
                  DropdownButtonFormField<String>(
                    value: selectVachicle,
                    items: <String>[
                      'Select',
                      'Bikes',
                      'Cars',
                      'Cycles',
                      'Buses',
                      'Others',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectVachicle = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Electronics')
                  DropdownButtonFormField<String>(
                    value: selectElectronics,
                    items: <String>[
                      'Select',
                      'smartPhones',
                      'Laptops',
                      'Tablets',
                      'Cameras',
                      'Camcoders',
                      'Drone',
                      'VRHeadset',
                      'OtherElectronic',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectElectronics = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Home Appliances')
                  DropdownButtonFormField<String>(
                    value: selectHomeAppliences,
                    items: <String>[
                      'Select',
                      'Refrigerators',
                      'Washing Machines',
                      'Microwaves',
                      'Airconditioner',
                      'VacumCleaner',
                      'Others Appliences',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectHomeAppliences = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Furniture')
                  DropdownButtonFormField<String>(
                    value: selectHomeFurniture,
                    items: <String>[
                      'Select',
                      'Sofas',
                      'Dining Tabels',
                      'Chairs',
                      'Bed Frames',
                      'Matteres',
                      'Coffe Tabel',
                      'Wall Art',
                      'Other Furntinure',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectHomeFurniture = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Tools & Equipment')
                  DropdownButtonFormField<String>(
                    value: selectToolsEquipment,
                    items: <String>[
                      'Select',
                      'Power Tools',
                      'Garding Tools',
                      'Passure Washer',
                      'Wood Working Tools',
                      'Painting Equipment',
                      'Others Tools',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectToolsEquipment = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Sports Equipment')
                  DropdownButtonFormField<String>(
                    value: selectSportsEquipment,
                    items: <String>[
                      'Select',
                      'CampingEquipm',
                      'Bicycles',
                      'Scotters',
                      'SportsGear',
                      'Fishing Equipment',
                      'Picnic Gear',
                      'BBQ Gear',
                      'Others Tools',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectSportsEquipment = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Party & Event Supplies')
                  DropdownButtonFormField<String>(
                    value: selectPartyEventSupplies,
                    items: <String>[
                      'Select',
                      'Party Tents',
                      'Projectors',
                      'SounSystem',
                      'Tablets',
                      'Chairs',
                      'Party Lights',
                      'Decorations',
                      'Others Supplies',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectPartyEventSupplies = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Baby & Kids Gear')
                  DropdownButtonFormField<String>(
                    value: selectBabyKidsGear,
                    items: <String>[
                      'Select',
                      'Cribs',
                      'Strollers',
                      'CarSeats',
                      'High Chairs',
                      'Baby Monitors',
                      'PlaySeats',
                      'Others Kids Gear',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectBabyKidsGear = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Travel & Luggage')
                  DropdownButtonFormField<String>(
                    value: selectTravelLuggage,
                    items: <String>[
                      'Select',
                      'Suitcases',
                      'Bags',
                      'Camping Gear',
                      'Travel Accerioes',
                      'Roof Racks',
                      'Others TravelItem',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectTravelLuggage = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Office Equipment')
                  DropdownButtonFormField<String>(
                    value: selectOfficeEquipment,
                    items: <String>[
                      'Select',
                      'Printers',
                      'Scanners',
                      'Desk',
                      'Chairs',
                      'Shredders',
                      'WhiteBoards',
                      'Projectors',
                      'OthersOfficeEqui',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectOfficeEquipment = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Fashion Accessories')
                  DropdownButtonFormField<String>(
                    value: selectFashionAccerioes,
                    items: <String>[
                      'Select',
                      'Party Waer',
                      'Hand Bags',
                      'Purses',
                      'Watches',
                      'Jawellery',
                      'Sunglases',
                      'Formal Wears',
                      'Exculise Mens',
                      'Others FashionAcc',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectFashionAccerioes = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Health & Fitness')
                  DropdownButtonFormField<String>(
                    value: selectHeathFitness,
                    items: <String>[
                      'Select',
                      'Treadmills',
                      'Ellipticals',
                      'Exercise Bike',
                      'YogaMats',
                      'Weight Lifting',
                      'Massage Chairs',
                      'Other Fashion Gear',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectHeathFitness = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Kitchen Appliances')
                  DropdownButtonFormField<String>(
                    value: selectKitchenAppliences,
                    items: <String>[
                      'Select',
                      'Blenders',
                      'Food Processor',
                      'Coffe MAchines',
                      'AirFaryes',
                      'Slow Cookers',
                      'Chef Knife',
                      'Other item',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectKitchenAppliences = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                if (selectedOption == 'Musical Instruments')
                  DropdownButtonFormField<String>(
                    value: selectMusicalInstruments,
                    items: <String>[
                      'Select',
                      'Guitars',
                      'Keyboards',
                      'Drum Sets',
                      'Violins',
                      'Cellos',
                      'DJ Equipment',
                      'Other Instruments',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectMusicalInstruments = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Real Estate Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Real Estate type is required';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      _submitDataToFirestore();
                    },
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Text('Submit'),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseApi {
  static UploadTask uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      throw Exception('Error uploading file');
    }
  }
}
