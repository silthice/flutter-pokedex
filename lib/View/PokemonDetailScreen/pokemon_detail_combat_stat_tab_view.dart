import 'package:flutter/material.dart';
import 'package:pokedex/Resources/Images/base_pokemon_detail_tab_stat.dart';

class PokemonDetailCombatStatTabView extends BasePokemonDetailTabStat {
  PokemonDetailCombatStatTabView({super.key});

  @override
  Widget buildContent() {
    // Return the specific widget for combat stats
    return const Center(
      child: Text('Combat Stats', style: TextStyle(color: Colors.blue)),
    );
  }
}
