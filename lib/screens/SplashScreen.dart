import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/screens/MainPage.dart';
import 'package:game_rating_app/screens/auth/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthProvider authProvider = AuthProvider();

  void verify_token() async {
    authProvider.verify_token();
    if (authProvider.isLogged == null) {
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    if (authProvider.isLogged!) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    verify_token();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        // color: Color(0xffFEF9E6),
        color: Colors.black,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    "https://wallpapers.com/images/hd/retro-game-mi0qhse0fqmttpug.jpg")),
            const LinearProgressIndicator(
              // color: ,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ],
        )),
      ),
    ));
  }
}
