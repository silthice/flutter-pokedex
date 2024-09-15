import 'package:flutter/material.dart';
import 'package:pokedex/Resources/Images/base_pokemon_detail_tab_stat.dart';

class PokemonDetailStatTabView extends BasePokemonDetailTabStat {
  PokemonDetailStatTabView({super.key});

  @override
  Widget buildContent() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            const Column(
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Weight',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Abilities',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemonDetailCtrl.getPokemonHeight(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  pokemonDetailCtrl.getPokemonWeight(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  pokemonDetailCtrl.getPokemonAbilities(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
