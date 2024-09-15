import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';
import 'package:pokedex/View/PokemonDetailScreen/tab_contents.dart';
import 'package:pokedex/View/custom_nav_bar.dart';
import 'package:pokedex/ViewModel/Controllers/pokemon_detail_controller.dart';

class PokemonDetailScreen extends StatelessWidget {
  final pokemonDetailCtrl = Get.put(PokemonDetailController());
  PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenDimension = MediaQuery.sizeOf(context);
    final pokemon = pokemonDetailCtrl.pokemon.value;
    String pokemonType = pokemonDetailCtrl.getPokemonType();
    String pokemonId = pokemonDetailCtrl.getPokemonId();
    String pokemonName = pokemonDetailCtrl.getPokemonName();
    List<Types> pokemonTypes = pokemonDetailCtrl.getPokemonTypeList();
    String pokemonImage = pokemonDetailCtrl.getPokemonDefaultImage();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                (getBackgroundColors[pokemonType] ?? Colors.white)
                    .withOpacity(0.3),
                (getBackgroundColors[pokemonType] ?? Colors.white)
                    .withOpacity(0.9),
                getBackgroundColors[pokemonType] ?? Colors.white,
              ])),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: screenDimension.height,
              width: screenDimension.width,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomNavBar(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              '${pokemonName.capitalize}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              '#${pokemonId}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27),
                        child: SizedBox(
                          height: 30,
                          width: 150,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: pokemonTypes.length,
                              itemBuilder: (context, idx) {
                                final type = pokemonTypes[idx].type?.name ?? "";
                                return Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: getTypeContainerColors[type] ??
                                        Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        '${type.toString().capitalize}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: screenDimension.height * 0.2,
                      right: 0,
                      child: Transform.rotate(
                          angle: -10,
                          child: Image.asset(
                            ImageAssets.pokeball,
                            height: 200,
                            width: 200,
                            color: Colors.white38,
                          ))),
                  Positioned(
                    bottom: 1,
                    child: Container(
                        height: screenDimension.height / 1.9,
                        width: screenDimension.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                          child: TabContents(pokemon,)
                        )),
                  ),
                  Positioned(
                    bottom: screenDimension.height * 0.485,
                    left: screenDimension.width * 0.2,
                    right: screenDimension.width * 0.2,
                    child: Image.network(
                      pokemonImage,
                      fit: BoxFit.fill,
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
