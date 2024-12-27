import 'package:flutter/material.dart';
class AnimatedDrawer extends StatelessWidget {
  final bool isOpen;
  final VoidCallback toggleDrawer;

  const AnimatedDrawer({Key? key, required this.isOpen, required this.toggleDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      transform: Matrix4.translationValues(isOpen ? 0 : -MediaQuery.of(context).size.width * 0.6, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        color: Colors.grey[200],
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle tap
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}

