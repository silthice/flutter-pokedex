import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';

class PokemonDetailController extends GetxController {
  final pokemon = Rx<PokemonDetailResponseDataModel?>(null);
  String getPokemonName() => pokemon.value?.name ?? "";
  String getPokemonId() => formatNumber(pokemon.value?.id ?? "");
  String getPokemonType() => pokemon.value?.types?[0].type?.name ?? "";
  String getPokemonDefaultImage() =>
      pokemon.value?.sprites?.other?.officialArtwork?.frontDefault ?? '';
  List<Types> getPokemonTypeList() => pokemon.value?.types ?? [];

  String getPokemonHeight() => formatHeight(pokemon.value?.height);
  String getPokemonWeight() => formatWeight(pokemon.value?.weight);
  String getPokemonAbilities() {
    final abilities = pokemon.value?.abilities;
    if (abilities == null) {
      return '-';
    }
    return abilities.map((abilityData) {
      return (abilityData.ability?.name as String).capitalize;
    }).join(', ');
  }

  String getPokemonWeaknesses() {
    List<String> typeNames = getPokemonTypeList()
        .map((e) => (e.type?.name ?? '').toString().capitalize ?? "")
        .toList();
    var weaknessList = getWeakness(typeNames).toList();

    if (weaknessList.isEmpty) {
      return '-';
    }
    var formattedString = weaknessList.toString();

    return formattedString.substring(1, formattedString.length - 1);
  }

  List<Stats> getPokemonStatsLbl() {
    List<Stats> statsList = pokemon.value?.stats ?? [];
    int totalBaseStat =
        statsList.fold(0, (sum, stat) => sum + (stat.baseStat as int));

    Stats totalStat = Stats(
      baseStat: totalBaseStat,
      stat: Stat(name: 'Total', url: ''),
    );
    return [...statsList, totalStat];
  }

  List<Stats> getPokemonStatsValue() {
    List<Stats> statsList = pokemon.value?.stats ?? [];
    int totalBaseStat =
        statsList.fold(0, (sum, stat) => sum + (stat.baseStat as int));

    Stats totalStat = Stats(
      baseStat: totalBaseStat,
      stat: Stat(name: 'Total', url: ''),
    );
    return [...statsList, totalStat];
  }
}
