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
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['height'] = this.height;

    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    if (url != null) {
      data['url'] = url; // Serialize the URL
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
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;
  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.officialArtwork != null) {
      data['official-artwork'] = this.officialArtwork!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
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
    stat = json['stat'] != null ? new Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Type {
  dynamic name;
  dynamic url;

  Type({this.name, this.url});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
