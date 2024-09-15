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
}
