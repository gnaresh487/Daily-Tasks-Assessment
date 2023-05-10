import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workruit_assessment/custom_widgets/custom_snackbar.dart';
import 'package:workruit_assessment/utils/constants.dart';
import 'package:workruit_assessment/utils/preference_helper.dart';

class SignUpController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController userMobileController;
  late TextEditingController userPasswordController;
  late TextEditingController confirmUserPasswordController;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    userMobileController = TextEditingController();
    userPasswordController = TextEditingController();
    confirmUserPasswordController = TextEditingController();
  }

  bool onSignUpClick() {
    if (signUpValidations()) {
      saveCredentials();
      /// Saving username, user mobile number and user password into shared preferences
      return true;
    } else {
      return false;
    }
  }

  bool signUpValidations() {
    bool isSignUpFieldsValid = false;
    if (userNameController.text.isEmpty) {
      CustomSnackBar.showSnackBar('User name', 'User name should not empty');
    } else if (userMobileController.text.length != 10) {
      CustomSnackBar.showSnackBar(
          'User mobile number', 'Enter a valid user mobile number');
    } else if (userPasswordController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          'User password', 'User password should not empty');
    } else if (userPasswordController.text !=
        confirmUserPasswordController.text) {
      CustomSnackBar.showSnackBar('User confirm password',
          'Confirm Password should be same as Password');
    } else {
      isSignUpFieldsValid = true;
    }
    return isSignUpFieldsValid;
  }

  void saveCredentials() {
    writeIntoStorage(Constants.userName, userNameController.text);
    writeIntoStorage(Constants.userMobileNumber, userMobileController.text);
    writeIntoStorage(Constants.userPassword, userPasswordController.text);
  }

  @override
  void dispose() {
    userNameController.dispose();
    userMobileController.dispose();
    userPasswordController.dispose();
    confirmUserPasswordController.dispose();
    super.dispose();
  }
}
