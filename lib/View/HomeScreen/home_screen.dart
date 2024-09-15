import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/View/HomeScreen/pokemon_list.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pokedex',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(child: PokemonList()),
                    ],
                  ),
                ),
              ),
            ),
            if (homeCtrl.isLoadingMore.value == true)
              Container(
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                  child: Image.asset(ImageAssets.pokeballBounce),
                ),
              ),
          ],
        ));
  }
}
