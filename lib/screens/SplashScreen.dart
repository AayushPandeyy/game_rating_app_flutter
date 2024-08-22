import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/MainPage.dart';
import 'package:game_rating_app/screens/auth/SignInScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await verifyAndLoadData();
    });
  }

  Future<void> verifyAndLoadData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    // Run both verification and game fetching in parallel
    await Future.wait([
      authProvider.verify_token(),
      gameProvider.fetchGames(),
    ]);

    await Future.delayed(const Duration(seconds: 2));

    if (authProvider.isLogged != null &&
        authProvider.isLogged! &&
        !authProvider.isLoading) {
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
