
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GetImage {
  static Future<String?> getImage() async {
    String? path;

    await Get.bottomSheet(
      isDismissible: false,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.camera);

                      path = xFile?.path;
                      if (Get.isBottomSheetOpen!) {
                        Get.back();
                      }
                    },
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Camera',
                        ),
                      ],
                    ),
                  ),
                  Container(height: 1, color: Colors.white),
                  ListTile(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      path = xFile?.path;
                      if (Get.isBottomSheetOpen!) {
                        Get.back();
                      }
                    },
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.file_copy,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Gallery',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  if (Get.isBottomSheetOpen!) Get.back();
                },
                dense: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'remove Image',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );

    return path;
  }
}

// Widget showProfileImage(String? url) {
//   return Container(
//     height: 56,
//     width: 56,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.grey,
//         border: Border.all(color: AppColors().appThemeColor, width: 0.5),
//         image: DecorationImage(
//           image: Image.network(
//             url == null
//                 ? "https://www.iconpacks.net/icons/1/free-user-icon-295-thumb.png"
//                 : "${Api.baseUrl}/${url}",
//             fit: BoxFit.fill,
//           ).image,
//         )),
//   );
// }
