import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/View/HomeScreen/pokemon_card.dart';
import 'package:pokedex/ViewModel/Controllers/search_pokemon_controller.dart';

class SearchedPokemonList extends StatelessWidget {
  SearchedPokemonList({super.key});
  final searchCtrl = Get.find<SearchPokemonController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchCtrl.searchedPokemonList.isEmpty &&
          searchCtrl.isLoadingMore.value == false) {
        return const Center(child: Text('No Pokémon found'));
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: searchCtrl.searchedPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = searchCtrl.searchedPokemonList[index];
          return PokemonCard(pokemon);
        },
      );
    });
  }
}
