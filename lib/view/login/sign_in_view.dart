import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/login/forgot_password_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtPassword,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isStay = !isStay;
                      });
                    },
                    icon: Icon(
                      isStay ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isStay
                          ? TColor.primary
                          : TColor.subTitle.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    "Stay Logged In",
                    style: TextStyle(
                      color: TColor.subTitle.withOpacity(0.3),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordView()));
                    },
                    child: Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        color: TColor.subTitle.withOpacity(0.3),
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        socialIcon("assets/img/google.png"),
                        socialIcon("assets/img/facebook.png"),
                        socialIcon("assets/img/apple.png"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              RoundLineButton(
                title: "Sign In",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 30,
      ),
    );
  }
}
