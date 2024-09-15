import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/ViewModel/Controllers/pokemon_detail_tab_controller.dart';

class TabContents extends StatelessWidget {
  TabContents(this.pokemon, {super.key});
  final dynamic pokemon;
  final tabBar = Get.put(PokemonDetailTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            controller: tabBar.controller,
            tabs: tabBar.tabs.map((Tab tab) {
              return tab;
            }).toList(),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(width: 3),
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.38,
              child: TabBarView(
                controller: tabBar.controller,
                children: tabBar.tabViews
              ),
            ),
          )
        ],
      ),
    );
  }
}
