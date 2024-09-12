import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';

class PokemonCard extends StatelessWidget {
  final dynamic pokemon;

  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    String pokemonType = pokemon.types![0].type!.name;
    String pokemonImage =
        pokemon.sprites?.other.officialArtwork.frontDefault ?? '';
    List<Types> pokemonTypes = pokemon.types;

    return GestureDetector(
      onTap: () {
        // Get.toNamed('/pokemonDetail', arguments: pokemon); /
      },
      child: Container(
        decoration: BoxDecoration(
          color: getBackgroundColors[pokemonType],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pokemon.name.toString().capitalize}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Image.network(
              pokemonImage,
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokemonTypes.length,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('hhaa'),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
