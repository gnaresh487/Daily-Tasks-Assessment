import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:workruit_assessment/controllers/sign_up_controller.dart';
import 'package:workruit_assessment/custom_widgets/custom_text_field.dart';
import 'package:workruit_assessment/ui/daily_tasks.dart';
import 'package:workruit_assessment/utils/app.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        leading: IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              textEditingController: _signUpController.userNameController,
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              textEditingController: _signUpController.userMobileController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              labelText: 'Mobile Number',
              hintText: 'Enter your mobile number',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              textEditingController: _signUpController.userPasswordController,
              isObscure: true,
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              textEditingController:
                  _signUpController.confirmUserPasswordController,
              isObscure: true,
              labelText: 'Confirm Password',
              hintText: 'Enter your password again',
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_signUpController.onSignUpClick()) {
                  appExt.push(DailyTasksScreen(), context);
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
