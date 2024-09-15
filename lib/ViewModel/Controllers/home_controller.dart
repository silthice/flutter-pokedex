import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_list_response_data_model.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart'; 
import 'package:pokedex/Repository/home_repository.dart';

class HomeController extends GetxController {
  final isLoadingMore = false.obs;
  final pokemonListModel = Rx<PokemonListResponseDataModel?>(null);
  final pokemonList = [].obs;

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
        Future.wait(list.map((pokemon) => getPokemonDetail(pokemon.url))).then((details) {
          pokemonList.addAll(details);
          isLoadingMore.value = false;
        });
      }
    });
  }

  Future<PokemonDetailResponseDataModel> getPokemonDetail(String url) async {
    var response = await HomeRepository.getPokemonDetail(url);
    return PokemonDetailResponseDataModel.fromJson(response, url: url);
  }
}
