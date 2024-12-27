import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:myrenthub/model/data_model.dart'; // adjust this import based on your actual data model

class DetailsScreen extends StatefulWidget {
  final DataModel data;

  DetailsScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xffE7ECF0),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Item Details",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
                    ),
                    Icon(Icons.shopping_cart, color: Colors.black),
                  ],
                ),
              ),
              // CarouselSlider implementation for thumbnails
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: widget.data.imageURLs.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewGallery.builder(
                                itemCount: widget.data.imageURLs.length,
                                builder: (context, index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: NetworkImage(widget.data.imageURLs[index]),
                                    initialScale: PhotoViewComputedScale.contained,
                                    minScale: PhotoViewComputedScale.contained * 0.8,
                                    maxScale: PhotoViewComputedScale.covered * 2,
                                    heroAttributes: PhotoViewHeroAttributes(tag: index),
                                  );
                                },
                                scrollPhysics: BouncingScrollPhysics(),
                                backgroundDecoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                pageController: PageController(initialPage: _currentIndex),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Title:",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.data.title ?? 'No title available',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "About:",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.data.littleDescription ?? "",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Business Name:",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          widget.data.companyName ?? '',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rent Per Day:",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          'Rs.${widget.data.rent ?? ''}',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Contact Seller'),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PhNo:  ${widget.data.phoneNumber ?? ''}'),
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(text: widget.data.phoneNumber ?? ''));
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Phone number copied')));
                                      },
                                      child: Icon(Icons.copy, color: Colors.black),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              "Contact Seller",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
