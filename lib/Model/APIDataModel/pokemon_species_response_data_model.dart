class PokemonSpeciesResponseDataModel {
  List<FlavorTextEntry>? flavorTextEntries;

    PokemonSpeciesResponseDataModel(
      {this.flavorTextEntries});

  PokemonSpeciesResponseDataModel.fromJson(Map<String, dynamic> json) {
    flavorTextEntries = json['flavor_text_entries'] != null
        ? (json['flavor_text_entries'] as List).map((v) => FlavorTextEntry.fromJson(v)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] = flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FlavorTextEntry {
  dynamic flavor_text;

  FlavorTextEntry({this.flavor_text});

  FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    flavor_text = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavor_text;
    return data;
  }
}