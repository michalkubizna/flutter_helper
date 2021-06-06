import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class PickerService {
  Future<Uint8List> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final PickedFile pickedFile = await picker.getImage(source: source);

    final Uint8List bytes = await pickedFile?.readAsBytes();

    return bytes;
  }
}