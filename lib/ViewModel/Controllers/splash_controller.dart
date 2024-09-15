import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_list_response_data_model.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart'; // Make sure you have this model
import 'package:pokedex/Repository/home_repository.dart';
import 'package:pokedex/View/HomeScreen/home_screen.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class SplashController extends GetxController {
  final homeCtrl = Get.put(HomeController());

  int getPokemonCount() => homeCtrl.pokemonListModel.value?.count.toInt() ?? 0;
  String getNextPageUrl() => homeCtrl.pokemonListModel.value?.next ?? '';
  String getPrevPageUrl() => homeCtrl.pokemonListModel.value?.previous ?? '';

  List<Results> setPokemonList() => homeCtrl.pokemonListModel.value?.results ?? [];

  void getPokemonList(int offset) {
    homeCtrl.isLoadingMore.value = true;
    HomeRepository.getPokemonList(offset).then((value) {
      homeCtrl.pokemonListModel.value = PokemonListResponseDataModel.fromJson(value);
      var list = homeCtrl.pokemonListModel.value?.results;
      
      if (list != null && list.isNotEmpty) {
        Future.wait(list.map((pokemon) => getPokemonDetail(pokemon.url))).then((details) {
          homeCtrl.pokemonList.addAll(details);
          homeCtrl.isLoadingMore.value = false;
          Get.offAll(() => HomeScreen(), transition: Transition.circularReveal);
        });
      }
    });
  }

  Future<PokemonDetailResponseDataModel> getPokemonDetail(String url) async {
    var response = await HomeRepository.getPokemonDetail(url);
    return PokemonDetailResponseDataModel.fromJson(response, url: url);
  }
}
