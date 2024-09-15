import 'package:flutter/material.dart';

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

double getStat(String stat, List<Map<String, dynamic>> pokemonStats) {
  const Map<String, int> statIndex = {
    'HP': 0,
    'ATTACK': 1,
    'DEFENSE': 2,
    'SP_ATK': 3,
    'SP_DEF': 4,
    'SPEED': 5,
  };

  if (statIndex.containsKey(stat)) {
    return pokemonStats[statIndex[stat]!]['base_stat'].toDouble();
  }

  return pokemonStats.fold(0, (sum, item) => sum + item['base_stat']);
}

double getProgress(String stat, List<Map<String, dynamic>> pokemonStats) {
  const Map<String, int> baseStat = {
    'HP': 255,
    'ATTACK': 190,
    'DEFENSE': 230,
    'SP_ATK': 194,
    'SP_DEF': 230,
    'SPEED': 180,
  };

  if (baseStat.containsKey(stat)) {
    return getStat(stat, pokemonStats) / baseStat[stat]!;
  }

  double totalBaseStats =
      pokemonStats.fold(0, (sum, item) => sum + item['base_stat']);
  double totalBaseStatValues =
      baseStat.values.fold(0, (sum, value) => sum + value);
  return totalBaseStats / totalBaseStatValues;
}

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
