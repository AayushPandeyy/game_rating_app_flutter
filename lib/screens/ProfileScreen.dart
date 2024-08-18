import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/auth/SignInScreen.dart';
import 'package:game_rating_app/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              AuthService().logout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignInScreen()));
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "Sign Out",
                style: const TextStyle(
                    fontFamily: "Gabarito", fontSize: 20, color: Colors.pink),
              )),
            ),
          ),
        ),
      ),
    ));
  }
}
