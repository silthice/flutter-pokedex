import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_list_response_data_model.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';
import 'package:pokedex/Repository/home_repository.dart';
import 'package:deepcopy/deepcopy.dart';

class HomeController extends GetxController {
  final isLoadingMore = false.obs;
  final pokemonListModel = Rx<PokemonListResponseDataModel?>(null);
  final pokemonList = [].obs;
  final oriPokemonList = [].obs;
  final filterSelectionList = <Type>[].obs;

  int getPokemonCount() => pokemonListModel.value?.count.toInt() ?? 0;
  String getNextPageUrl() => pokemonListModel.value?.next ?? '';
  String getPrevPageUrl() => pokemonListModel.value?.previous ?? '';

  List<Results> setPokemonList() => pokemonListModel.value?.results ?? [];

  void getPokemonList(int offset) {
    isLoadingMore.value = true;
    HomeRepository.getPokemonList(offset).then((value) {
      pokemonListModel.value = PokemonListResponseDataModel.fromJson(value);
      var list = pokemonListModel.value?.results;

      if (list != null && list.isNotEmpty) {
        Future.wait(list.map((pokemon) => getPokemonDetail(pokemon.url)))
            .then((details) {
          pokemonList.addAll(details);
          oriPokemonList.value = pokemonList.deepcopy();
          isLoadingMore.value = false;
        });
      }
    });
  }

  Future<PokemonDetailResponseDataModel> getPokemonDetail(String url) async {
    var response = await HomeRepository.getPokemonDetail(url);
    return PokemonDetailResponseDataModel.fromJson(response, url: url);
  }

  void resetFilterSelection() {
    filterSelectionList.value = [];
  }

  void handleFilterSelection(Type type) {
    if (filterSelectionList.contains(type)) {
      filterSelectionList.remove(type);
    } else {
      if (filterSelectionList.length >= 2) {
        return;
      }

      filterSelectionList.add(type);
    }
  }

  void filterPokemonList() {
    if (filterSelectionList.isEmpty) {
      pokemonList.value = [...oriPokemonList];
      return;
    }
    isLoadingMore.value = true;

    var filteredPokemons = oriPokemonList.where((pokemon) {
      return filterSelectionList.every((selectedType) {
        return pokemon.types?.any((pokemonType) {
              return selectedType.name == pokemonType.type?.name;
            }) ??
            false;
      });
    }).toList();
    
    pokemonList.value = [...filteredPokemons];

    Future.delayed(const Duration(milliseconds: 300), () {
      isLoadingMore.value = false;
    });
  }
}
