import 'dart:math';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  Future<Uint8List> image() async {
    final PickedFile file = await ImagePicker().getImage(source: ImageSource.gallery);

    final Uint8List list = await file?.readAsBytes();

    return list;
  }

  Future<String> uploadImage(Uint8List image, {String noPhoto = ""}) async {
    final int random = Random().nextInt(1000000);

    final uid = AuthService().uid();

    final filePath = 'images/$uid/$random$noPhoto.png';

    final Reference reference = FirebaseStorage.instance.ref().child(filePath);

    final TaskSnapshot taskSnapshot = await reference.putData(image, SettableMetadata(
      contentType: "image/png",
    ));

    final String url = await taskSnapshot.ref.getDownloadURL();

    return url;
  }

  Future<void> deleteImage(String filePath) async {
    final Reference reference =
        FirebaseStorage.instance.ref().storage.refFromURL(filePath);

    await reference.delete();
  }

  Future<String> assetToFile(String image) async {
    final ByteData byteData = await rootBundle.load("images/$image");

    final Uint8List list = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    final String picture = await uploadImage(list, noPhoto: "noPhoto");

    return picture;
  }
}
