import 'package:get/get.dart';

class UpdateBioController extends GetxController {
 RxString _newBio = ''.obs;
  String get newBio => _newBio.value;

  
  void setNewBio(String value) {
    _newBio.value = value;
  }

  

}