import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:workruit_assessment/custom_widgets/custom_snackbar.dart';
import 'package:workruit_assessment/utils/constants.dart';
import 'package:workruit_assessment/utils/preference_helper.dart';

class SignInController extends GetxController {
  late TextEditingController userMobileController;
  late TextEditingController userPasswordController;

  @override
  void onInit() {
    super.onInit();
    userMobileController = TextEditingController();
    userPasswordController = TextEditingController();
  }

  Future<bool> onSignInClick() async {
    if (await signInValidation()) {
      /// Save the signIn boolean to shared preferences, we use this value to check if the user is already signed in or not.
      writeIntoStorage(Constants.isSignInPref, true);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signInValidation() async {
    bool signInValidation = false;
    if (userMobileController.text.length != 10) {
      CustomSnackBar.showSnackBar(
          'User mobile number', 'Enter a valid user mobile number');
    } else if (userPasswordController.text.isEmpty) {
      CustomSnackBar.showSnackBar("Password", "This field is required");
    } else {
      final userMobileNumber =
          await readFromStorage(Constants.userMobileNumber);
      final userPassword = await readFromStorage(Constants.userPassword);
      if (userMobileController.text == userMobileNumber &&
          userPasswordController.text == userPassword) {
        signInValidation = true;
      } else {
        CustomSnackBar.showSnackBar('Something went wrong',
            'Please check your mobile number or password');
      }
    }
    return signInValidation;
  }

  @override
  void dispose() {
    userPasswordController.dispose();
    userMobileController.dispose();
    super.dispose();
  }
}
