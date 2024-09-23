import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';
import 'package:pokedex/ViewModel/Controllers/pokemon_detail_controller.dart';

class PokemonCard extends StatelessWidget {
  final dynamic pokemon;
  final pokemonDetailCtrl = Get.put(PokemonDetailController());

  PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    String pokemonType = pokemon.types![0].type!.name;
    String pokemonImage =
        pokemon.sprites?.other.officialArtwork.frontDefault ?? '';
    List<Types> pokemonTypes = pokemon.types;

    return GestureDetector(
      onTap: () {
        pokemonDetailCtrl.pokemon.value = pokemon;
        pokemonDetailCtrl.getDescription();
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              (getBackgroundColors[pokemonType] ?? Colors.white)
                  .withOpacity(.1),
              getBackgroundColors[pokemonType] ?? Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${pokemon.name.toString().capitalize}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: 90,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: pokemonTypes.length,
                      itemBuilder: (context, idx) {
                        final type = pokemonTypes[idx].type?.name ?? "";
                        return Container(
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getTypeContainerColors[type] ??
                                Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              type.toString().capitalize ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: -5,
              child: Transform.rotate(
                  angle: -10,
                  child: Image.asset(
                    ImageAssets.pokeball,
                    height: 105,
                    width: 105,
                    color: Colors.white24,
                  ))),
          Positioned(
            bottom: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl: pokemonImage,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 105,
              width: 105,
            ),
          ),
        ]),
      ),
    );
  }
}
