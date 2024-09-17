import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class SearchPokemonController extends GetxController {
  var homeCtrl = Get.put(HomeController());
  final isLoadingMore = false.obs;
  final searchedPokemonList = [].obs;
  final editController = TextEditingController();


  void searchPokemonList() {
    if (editController.text.isEmpty) {
      searchedPokemonList.value = [];
      return;
    }
    isLoadingMore.value = true;

    var searchTerm = editController.text.toLowerCase();
    var filteredPokemons = homeCtrl.oriPokemonList.where((pokemon) {
      return pokemon.name.toString().toLowerCase().contains(searchTerm);
    });
    searchedPokemonList.value = [...filteredPokemons];

    Future.delayed(const Duration(milliseconds: 300), () {
      isLoadingMore.value = false;
    });
  }

}