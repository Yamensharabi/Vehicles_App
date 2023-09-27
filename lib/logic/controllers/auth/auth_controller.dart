import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthController extends GetxController {
  //Show or hide the password
  void changeVisibility();

  //Agreeing to the terms or not agreeing
  void changeCheck();

  //Fetch the image from the user
  void getImageProfile(ImageSource imageSource);
}

class AuthControllerImp extends AuthController {
  bool isVisibility = false;
  bool isChecked = false;
  XFile? imageProfile;
  XFile? newImageProfile;
//----------------------------------------------------------------

  @override
  void changeVisibility() {
    isVisibility = !isVisibility;
    update();
  }

//----------------------------------------------------------------

  @override
  void changeCheck() {
    isChecked = !isChecked;
    update();
  }

//----------------------------------------------------------------

  @override
  void getImageProfile(ImageSource imageSource) async {
    newImageProfile = await ImagePicker().pickImage(source: imageSource);
    if (newImageProfile != null) imageProfile = newImageProfile;
    Get.back();
    update();
  }
}
