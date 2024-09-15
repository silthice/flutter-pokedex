import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/pokemon_detail_controller.dart';

abstract class BasePokemonDetailTabStat extends StatelessWidget {

  final PokemonDetailController pokemonDetailCtrl = Get.put(PokemonDetailController());
  BasePokemonDetailTabStat({super.key});

  @override
  Widget build(BuildContext context) {
    return buildContent();
  }
  
  Widget buildContent();
}