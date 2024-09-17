import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Resources/Images/image_assets.dart';
import 'package:pokedex/View/SearchScreen/searched_pokemon_list.dart';
import 'package:pokedex/ViewModel/Controllers/search_pokemon_controller.dart';

class SearchScreen extends StatelessWidget {
  final searchCtrl = Get.put(SearchPokemonController());
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenDimension = MediaQuery.sizeOf(context);
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
              body: SafeArea(
                  child: SizedBox(
            height: screenDimension.height,
            width: screenDimension.width,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: GestureDetector(
                            onTap: () {
                              searchCtrl.reset();
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: TextFormField(
                                controller: searchCtrl.editController,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  border: const OutlineInputBorder(),
                                  labelText: 'Search',
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                ),
                                onFieldSubmitted: (value) {
                                  searchCtrl.searchPokemonList();
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter task title';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Results: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchedPokemonList(),
                    ),
                  ),
                ],
              ),
            ),
          ))),
          Scaffold(
              body: SafeArea(
                  child: SizedBox(
            height: screenDimension.height,
            width: screenDimension.width,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: GestureDetector(
                            onTap: () {
                              searchCtrl.editController.clear();
                              searchCtrl.searchedPokemonList.value = [];
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: TextFormField(
                                controller: searchCtrl.editController,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  border: const OutlineInputBorder(),
                                  labelText: 'Search',
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                ),
                                onFieldSubmitted: (value) {
                                  searchCtrl.searchPokemonList();
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter task title';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Results: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchedPokemonList(),
                    ),
                  ),
                ],
              ),
            ),
          ))),
          if (searchCtrl.isLoadingMore.value == true)
            Container(
              color: Colors.grey.withOpacity(0.5),
              child: Center(
                child: Image.asset(ImageAssets.pokeballBounce),
              ),
            ),
        ],
      );
    });
  }
}
