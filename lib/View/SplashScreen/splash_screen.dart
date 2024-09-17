import 'package:flutter/material.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/ViewModel/Services/SplashScreen/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices.getPokemonList(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImageAssets.pokeballBounce2)),
    );
  }
}
