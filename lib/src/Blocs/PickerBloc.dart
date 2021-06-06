import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class PickerBloc {
  final BehaviorSubject _streamController = BehaviorSubject();

  Stream get imageStream => _streamController.stream;

  set data(List<String> urls) {
    _dataValue = urls;

    _streamController.add([data, false]);
  }

  List<String> _dataValue = [];

  List<String> get data => _dataValue;

  void addLink(String url) {
    data.add(url);

    _streamController.add([data, false]);
  }

  Future<void> addPhoto(ImageSource source) async {
    final Uint8List bytes = await PickerService().pickImage(source);

    if (bytes != null) {
      _streamController.add([data, true]);

      final String url = await StorageService().uploadImage(bytes);

      data.add(url);

      _streamController.add([data, false]);
    }
  }

  void removePhoto(String url) {
    StorageService().deleteImage(url);

    data.remove(url);

    _streamController.add([data, false]);
  }

  void dispose() {
    _streamController.close();
  }
}
