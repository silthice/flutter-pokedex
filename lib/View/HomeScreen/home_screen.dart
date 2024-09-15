import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/View/HomeScreen/filter_dialog.dart';
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
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                onPressed: () {
                  Get.defaultDialog(
                    onWillPop: () async {
                      return true;
                    },
                    title: 'Filter',
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    radius: 10,
                    content: FilterDialog(), // The dialog content
                  );
                },
                child: const Icon(Icons.tune),
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
