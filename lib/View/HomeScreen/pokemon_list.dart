import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/View/HomeScreen/pokemon_card.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class PokemonList extends StatelessWidget {
  PokemonList({super.key});
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeCtrl.pokemonList.isEmpty) {
        return const Center(child: Text('No Pokémon found'));
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10,
        ),
        itemCount: homeCtrl.pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = homeCtrl.pokemonList[index];
          return PokemonCard(pokemon);
        },
      );
    });
  }
}
