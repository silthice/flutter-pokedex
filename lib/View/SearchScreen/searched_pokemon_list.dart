import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokedex/View/HomeScreen/pokemon_card.dart';
import 'package:pokedex/ViewModel/Controllers/search_pokemon_controller.dart';

class SearchedPokemonList extends StatelessWidget {
  SearchedPokemonList({super.key});
  final ScrollController scrollController = ScrollController();
  final searchCtrl = Get.find<SearchPokemonController>();

  @override
  Widget build(BuildContext context) {
    ever(searchCtrl.searchedPokemonList, (_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 150,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Obx(() {
      if (searchCtrl.searchedPokemonList.isEmpty &&
          searchCtrl.isLoadingMore.value == false) {
        return const Center(child: Text('No Pokémon found'));
      }

      return LazyLoadScrollView(
        onEndOfPage: () => searchCtrl.showMorePokemon(),
        child: GridView.builder(
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
        ),
      );
    });
  }
}
