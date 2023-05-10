import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:workruit_assessment/controllers/sign_in_controller.dart';
import 'package:workruit_assessment/custom_widgets/custom_text_field.dart';
import 'package:workruit_assessment/ui/daily_tasks.dart';
import 'package:workruit_assessment/ui/sign_up.dart';
import 'package:workruit_assessment/utils/app.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white60, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  textEditingController: _signInController.userMobileController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  labelText: 'Mobile number',
                  hintText: 'Enter your mobile number',
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  textEditingController:
                      _signInController.userPasswordController,
                  isObscure: true,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                const SizedBox(height: 16.0),
                MaterialButton(
                  onPressed: () {
                    _signInController.onSignInClick().then((value) {
                      if (value) {
                        appExt.push(DailyTasksScreen(), context);
                      }
                    });
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Sign In',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Don't have an account ?"),
                    MaterialButton(
                      onPressed: () {
                        appExt.push(SignUpScreen(), context);
                      },
                      textColor: Colors.white,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Create New Account",
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
