import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_call/view/page/home_page.dart';
import 'package:my_call/view/page/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // primarySwatch: Colors.indigo,
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, size.height * 0.06)),
          )),
      home: FirebaseAuth.instance.currentUser != null
          ? const HomePage()
          : const SignUpPage(),
    );
  }
}
