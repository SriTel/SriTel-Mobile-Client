import 'package:SriTel/controllers/auth_controller.dart';
import 'package:SriTel/screens/signin_screen.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthController _authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController retypePasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 390,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                  color: SriTelColor.lightGrey.withOpacity(0.3)
              ),
              child: SvgPicture.asset("assets/images/sign-up.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign-Up',
                    style: TextStyle(
                      color: SriTelColor.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(
                    height: 15,
                  ),
                  InputField(
                    labelText: 'Email',
                    controller: emailController,
                    type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'First Name',
                    controller: firstNameController,
                    type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'Last Name',
                    controller: lastNameController,
                    type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'NIC',
                    controller: nicController,
                    type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'Mobile Number',
                    controller: mobileNumberController,
                    type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'Password',
                    controller: passwordController,
                    type: InputType.separateTitle,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    labelText: 'Retype Password',
                    controller: retypePasswordController,
                    type: InputType.separateTitle,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(
                      buttonText: "Sign-Up",
                      onPressed: () async {
                        if(await _authController.signUp(
                          emailController.text,
                          firstNameController.text,
                          lastNameController.text,
                          nicController.text,
                          mobileNumberController.text,
                          passwordController.text,
                          retypePasswordController.text
                        )) Get.to(() => SignInScreen());
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontSize: 12,
                            color: SriTelColor.grey
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Get.to(() => SignInScreen()),
                          child: const Text(
                            'Sign-In',
                            style: TextStyle(
                                fontSize: 12,
                                color: SriTelColor.primaryColor
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
