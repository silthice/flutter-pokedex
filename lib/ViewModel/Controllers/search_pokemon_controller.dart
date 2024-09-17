import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class SearchPokemonController extends GetxController {
  var homeCtrl = Get.put(HomeController());
  final isLoadingMore = false.obs;
  final searchedPokemonList = [].obs;
  final oriSearchedPokemonList = [].obs;
  final editController = TextEditingController();
  final offset = 10.obs;

  void searchPokemonList() {
    if (editController.text.isEmpty) {
      searchedPokemonList.value = [];
      return;
    }
    isLoadingMore.value = true;

    var searchTerm = editController.text.toLowerCase();
    var filteredPokemons = homeCtrl.oriPokemonList.where((pokemon) {
      return pokemon.name.toString().toLowerCase().contains(searchTerm);
    }).toList();
    filteredPokemons.sort((a, b) => a.name.compareTo(b.name));
    oriSearchedPokemonList.value = [...filteredPokemons];
    searchedPokemonList.value = oriSearchedPokemonList.take(offset.value).toList();

    Future.delayed(const Duration(milliseconds: 300), () {
      isLoadingMore.value = false;
    });
  }

  void showMorePokemon() {
    if (isLoadingMore.value) return;
    isLoadingMore.value = true;
    offset.value += 10;
    searchedPokemonList.value = oriSearchedPokemonList.take(offset.value).toList();
    Future.delayed(const Duration(milliseconds: 100), () {
      isLoadingMore.value = false;
    });
  }

  void reset() {
   editController.clear();
   searchedPokemonList.value = [];
   offset.value = 3;
  }

}