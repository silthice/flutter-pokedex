import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/View/PokemonDetailScreen/pokemon_detail_combat_stat_tab_view.dart';
import 'package:pokedex/View/PokemonDetailScreen/pokemon_detail_about_tab_view.dart';

class PokemonDetailTabController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'About'),
    const Tab(text: 'Stats'),
  ];

  final List<Widget> tabViews = <Widget>[
    PokemonDetailAboutTabView(),
    PokemonDetailCombatStatTabView(),
    
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
