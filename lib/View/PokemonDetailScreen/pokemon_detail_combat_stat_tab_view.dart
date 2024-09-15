import 'package:flutter/material.dart';
import 'package:pokedex/Resources/Images/base_pokemon_detail_tab_stat.dart';
import 'package:pokedex/Utilities/Extensions/string_extension.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PokemonDetailCombatStatTabView extends BasePokemonDetailTabStat {
  PokemonDetailCombatStatTabView({super.key});

  @override
  Widget buildContent() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemonDetailCtrl.getPokemonStatsLbl().map((e) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '${e.stat?.name.toString().capitalize()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey),
                    ));
              }).toList(),
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemonDetailCtrl.getPokemonStatsLbl().map((e) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '${e.baseStat?.toString().capitalize()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey),
                    ));
              }).toList(),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemonDetailCtrl.getPokemonStatsValue().map((e) {
                  int totalSteps = e.stat?.name == 'Total' ? 255 * 6 : 255;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 20,
                      color: Colors.transparent,
                      child: StepProgressIndicator(
                        totalSteps: totalSteps,
                        currentStep: e.baseStat,
                        size: 5,
                        padding: 0,
                        roundedEdges: const Radius.circular(15),
                        selectedColor: getStatColors[e.stat?.name] ?? getBackgroundColors[pokemonDetailCtrl.pokemon.value?.types?.first.type?.name] ?? Colors.black,
                        unselectedColor: Colors.grey.withOpacity(.25),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
