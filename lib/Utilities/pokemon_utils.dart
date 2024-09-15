import 'package:flutter/material.dart';
import 'package:pokedex/Model/APIDataModel/pokemon_detail_response_data_model.dart';

const Map<String, Color> getTypeContainerColors = {
  'normal': Color(0xFFC1C1A1),
  'grass': Color(0xFFA2D882),
  'fire': Color(0xFFF3A76E),
  'water': Color(0xFF92B1F4),
  'electric': Color(0xFFFAE076),
  'ice': Color(0xFFB4E4E2),
  'fighting': Color(0xFFDD625D),
  'poison': Color(0xFFC76CC5),
  'ground': Color(0xFFEAD292),
  'flying': Color(0xFFC2AFF6),
  'psychic': Color(0xFFFB86AA),
  'bug': Color(0xFFD2E545),
  'rock': Color(0xFFD2C169),
  'ghost': Color(0xFF9B84B8),
  'dark': Color(0xFFA58570),
  'dragon': Color(0xFF9970FD),
  'steel': Color(0xFFCCCCDC),
  'fairy': Color(0xFFE2A8C5),
};

const Map<String, Color> getBackgroundColors = {
  'normal': Color(0xFFA8A77A),
  'grass': Color(0xFF7AC74C),
  'fire': Color(0xFFEE8130),
  'water': Color(0xFF6390F0),
  'electric': Color(0xFFF7D02C),
  'ice': Color(0xFF96D9D6),
  'fighting': Color(0xFFC22E28),
  'poison': Color(0xFFA33EA1),
  'ground': Color(0xFFE2BF65),
  'flying': Color(0xFFA98FF3),
  'psychic': Color(0xFFF95587),
  'bug': Color(0xFFA6B91A),
  'rock': Color(0xFFB6A136),
  'ghost': Color(0xFF735797),
  'dark': Color(0xFF705746),
  'dragon': Color(0xFF6F35FC),
  'steel': Color(0xFFB7B7CE),
  'fairy': Color(0xFFD685AD),
};

List<Type> getPokemonTypeList() {
  return [
    Type(name: 'normal'),
    Type(name: 'grass'),
    Type(name: 'fire'),
    Type(name: 'water'),
    Type(name: 'electric'),
    Type(name: 'ice'),
    Type(name: 'fighting'),
    Type(name: 'poison'),
    Type(name: 'ground'),
    Type(name: 'flying'),
    Type(name: 'psychic'),
    Type(name: 'bug'),
    Type(name: 'rock'),
    Type(name: 'ghost'),
    Type(name: 'dark'),
    Type(name: 'dragon'),
    Type(name: 'steel'),
    Type(name: 'fairy'),
  ];
}

const Map<String, Color> getStatColors = {
  'hp': Color(0xFF2fd64e),
  'attack': Color(0xFFff2e00),
  'defense': Color(0xFF2fd64e),
  'special-attack': Color(0xFFa155f2),
  'special-defense': Color(0xFFa155f2),
  'speed': Color(0xFFe8e654),
  'total': Color(0xFF2d33cf),
};

String formatNumber(int number) {
  if (number < 10) {
    return '00$number';
  } else if (number < 100) {
    return '0$number';
  } else {
    return '$number';
  }
}

String formatHeight(int? number) {
  if (number == null) {
    return '-';
  }
  double heightInMeters = number / 10;
  return '${heightInMeters.toStringAsFixed(1)} m';
}

String formatWeight(int? number) {
  if (number == null) {
    return '-';
  }
  double weightInKg = number / 10;
  return '${weightInKg.toStringAsFixed(1)} kg';
}

Map<String, List<String>> typeWeaknesses = {
  'Normal': ['Fighting'],
  'Fire': ['Water', 'Ground', 'Rock'],
  'Water': ['Grass', 'Electric'],
  'Grass': ['Fire', 'Ice', 'Poison', 'Flying', 'Bug'],
  'Electric': ['Ground'],
  'Ice': ['Fire', 'Fighting', 'Rock', 'Steel'],
  'Fighting': ['Flying', 'Psychic', 'Fairy'],
  'Poison': ['Ground', 'Psychic'],
  'Ground': ['Water', 'Grass', 'Ice'],
  'Flying': ['Electric', 'Ice', 'Rock'],
  'Psychic': ['Bug', 'Ghost', 'Dark'],
  'Bug': ['Flying', 'Rock', 'Fire'],
  'Rock': ['Water', 'Grass', 'Fighting', 'Ground', 'Steel'],
  'Ghost': ['Ghost', 'Dark'],
  'Dragon': ['Ice', 'Dragon', 'Fairy'],
  'Dark': ['Fighting', 'Bug', 'Fairy'],
};

Map<String, List<String>> typeImmunities = {
  'Normal': ['Ghost'],
  'Ground': ['Electric'],
  'Flying': ['Ground'],
  'Ghost': ['Normal', 'Fighting'],
  'Dark': ['Psychic'],
  'Steel': ['Poison'],
};

Map<String, List<String>> typeResistances = {
  'Normal': [],
  'Fire': ['Grass', 'Ice', 'Bug', 'Steel', 'Fairy', 'Steel'],
  'Water': ['Fire', 'Water', 'Ice', 'Steel'],
  'Grass': ['Water', 'Electric', 'Grass', 'Ground'],
  'Electric': ['Electric', 'Flying', 'Steel'],
  'Ice': ['Ice'],
  'Fighting': ['Bug', 'Rock', 'Dark'],
  'Poison': ['Grass', 'Fairy', 'Fighting', 'Poison', 'Bug'],
  'Ground': ['Poison', 'Rock'],
  'Flying': ['Grass', 'Fighting', 'Bug'],
  'Psychic': ['Fighting', 'Psychic'],
  'Bug': ['Grass', 'Fighting', 'Ground'],
  'Rock': ['Normal', 'Fire', 'Poison', 'Flying'],
  'Ghost': ['Poison', 'Bug'],
  'Dragon': ['Fire', 'Water', 'Electric', 'Grass'],
  'Dark': ['Ghost', 'Dark'],
};

Set<String> getWeakness(List<String> types) {
  Set<String> collectedWeaknesses = {};
  Set<String> collectedImmunities = {};
  Set<String> collectedResistances = {};

  for (var type in types) {
    if (typeWeaknesses.containsKey(type)) {
      collectedWeaknesses.addAll(typeWeaknesses[type]!);
    }
    if (typeImmunities.containsKey(type)) {
      collectedImmunities.addAll(typeImmunities[type]!);
    }
    if (typeResistances.containsKey(type)) {
      collectedResistances.addAll(typeResistances[type]!);
    }
  }

  collectedWeaknesses.removeAll(types);
  collectedWeaknesses.removeAll(collectedImmunities);

  collectedWeaknesses.removeAll(collectedResistances);

  return collectedWeaknesses;
}
