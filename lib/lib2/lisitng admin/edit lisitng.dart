import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditListingPage extends StatefulWidget {
  final DocumentSnapshot doc;

  EditListingPage({required this.doc});

  @override
  _EditListingPageState createState() => _EditListingPageState();
}

class _EditListingPageState extends State<EditListingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.doc['title']);
    _descriptionController = TextEditingController(text: widget.doc['description']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Listing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
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

  void _updateListing() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('listings').doc(widget.doc.id).update({
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      Navigator.pop(context);
    }
  }
}
