import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomerController extends GetxController {
  // Use Rx<XFile?> to make it reactive
  Rx<XFile?> _imageFile = Rx<XFile?>(null);

  // Getter to access the picked file
  XFile? get pickedFile => _imageFile.value;

  final ImagePicker _imagePicker = ImagePicker();

  // For picking an image from either gallery or camera
  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      _imageFile.value = pickedFile; // Update the Rx value
    } else {
      print("No image selected.");
    }
  }
}

