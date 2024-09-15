import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Utilities/pokemon_utils.dart';
import 'package:pokedex/ViewModel/Controllers/home_controller.dart';

class FilterDialog extends StatelessWidget {
  var homeCtrl = Get.put(HomeController());
  FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var screenDimension = MediaQuery.sizeOf(context);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: screenDimension.height / 1.745,
        width: screenDimension.width / 1.25,
        child: Column(children: [
          Obx(() {
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (3),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: getPokemonTypeList().map((e) {
                  final isSelected = homeCtrl.filterSelectionList.contains(e);
                  return GestureDetector(
                    onTap: () => homeCtrl.handleFilterSelection(e),
                    child: Container(
                      height: 30,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border.all(
                                color: Colors.redAccent,
                                width: 3) // Add red border if selected
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        color: getTypeContainerColors[e.name] ??
                            Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          e.name.toString().capitalize ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList());
          }),
          const SizedBox(height: 15,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                homeCtrl.filterPokemonList();
                Get.back();
              },
              child: const Text('Confirm')),
        ]));
  }
}
