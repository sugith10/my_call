import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_call/view/page/home_page.dart';

import '../../service/auth_service.dart';
import '../widget/auth_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailCntrl = TextEditingController();
  final passwordCntrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCntrl.dispose();
    passwordCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: size.width * 0.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            AuthTextFromField(
                controller: emailCntrl,
                hintText: "Email",
                icon: Icons.email,
                validator: ValidationBuilder().email().maxLength(50).build()),
            const SizedBox(height: 20),
            AuthTextFromField(
                controller: passwordCntrl,
                hintText: "Password",
                icon: Icons.password,
                validator:
                    ValidationBuilder().maxLength(14).minLength(6).build()),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  log("hello");
                  if (formKey.currentState?.validate() ?? false) {
                    await AuthService()
                        .signIn(emailCntrl.text, passwordCntrl.text)
                        .then((e) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    });
                  }
                },
                child: const Text("Sign Up")),
          ],
        ),
      )),
    );
  }
}
