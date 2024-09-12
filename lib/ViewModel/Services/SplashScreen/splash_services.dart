import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class SplashServices {
  static void getPokemonList(int offset) {
    final homeCtrl = Get.put(HomeController());
    homeCtrl.getPokemonList(offset);
  }
}