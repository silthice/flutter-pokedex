import 'package:equatable/equatable.dart';

class PokemonDetailResponseDataModel {
  dynamic height;
  dynamic id;
  dynamic name;
  dynamic order;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  List<Abilities>? abilities;
  dynamic weight;
  dynamic url;

  PokemonDetailResponseDataModel(
      {this.height,
      this.id,
      this.name,
      this.order,
      this.sprites,
      this.stats,
      this.types,
      this.abilities,
      this.weight,
      this.url});

  PokemonDetailResponseDataModel.fromJson(Map<String, dynamic> json,
      {this.url}) {
    height = json['height'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    stats = json['stats'] != null
        ? (json['stats'] as List).map((v) => Stats.fromJson(v)).toList()
        : null;
    types = json['types'] != null
        ? (json['types'] as List).map((v) => Types.fromJson(v)).toList()
        : null;
    abilities = json['abilities'] != null
        ? (json['abilities'] as List).map((v) => Abilities.fromJson(v)).toList()
        : null;
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['height'] = height;

    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    if (url != null) {
      data['url'] = url;
    }
    return data;
  }
}

class Sprites {
  dynamic frontDefault;
  Other? other;

  Sprites({
    this.frontDefault,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;
  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    return data;
  }
}

class OfficialArtwork {
  dynamic frontDefault;
  dynamic frontShiny;

  OfficialArtwork({this.frontDefault, this.frontShiny});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Stats {
  dynamic baseStat;
  dynamic effort;
  Stat? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Stat {
  dynamic name;
  dynamic url;

  Stat({this.name, this.url});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Types {
  dynamic slot;
  Type? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type extends Equatable {
  dynamic name;
  dynamic url;

  Type({this.name, this.url});

  @override
  List<Object?> get props => [name];

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Abilities {
  Ability? ability;

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    return data;
  }
}

class Ability {
  dynamic name;
  dynamic url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
