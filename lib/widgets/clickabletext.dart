import 'package:flutter/material.dart';

class ClickableText extends StatefulWidget {
  final String title;
  final String details;

  ClickableText({required this.title, required this.details});

  @override
  _ClickableTextState createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  bool showDetails = false;

  void toggleDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,top: 12,right: 12,bottom: 5),
                  child: Row(
                    children: [
                      Text(
                      widget.title,
                        style:TextStyle(fontSize: 13,fontWeight: FontWeight.w400),


                      ),
                      Spacer(),
                      InkWell(
                          onTap: toggleDetails,
                          child: Icon(Icons.keyboard_arrow_down_outlined))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                child: Visibility(
                  visible: showDetails,
                  child: Text(
                  widget.details,
                      style: TextStyle(fontSize: 11,fontWeight: FontWeight.w300)
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

