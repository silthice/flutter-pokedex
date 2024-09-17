import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokedex/View/HomeScreen/pokemon_card.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class PokemonList extends StatelessWidget {
  PokemonList({super.key});
  final homeCtrl = Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    ever(homeCtrl.pokemonList, (_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 150,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Obx(() {
      if (homeCtrl.pokemonList.isEmpty &&
          homeCtrl.isLoadingMore.value == false) {
        return const Center(child: Text('No Pokémon found'));
      }

      return LazyLoadScrollView(
        onEndOfPage: () {
          homeCtrl.getPokemonList(homeCtrl.currentOffset.value);
          return;
        },
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: homeCtrl.pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = homeCtrl.pokemonList[index];
            return PokemonCard(pokemon);
          },
        ),
      );
    });
  }
}
