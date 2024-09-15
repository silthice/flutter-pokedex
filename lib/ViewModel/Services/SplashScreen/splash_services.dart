import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/splash_controller.dart';

class SplashServices {
  static void getPokemonList(int offset) {
    final splashCtrl = Get.put(SplashController());
    splashCtrl.getPokemonList(offset);
  }
}