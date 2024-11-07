class PokemonDetails{
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<Type> types;
  final List<Form> forms;
  final Sprites sprites;


  PokemonDetails(this.id, this.name, this.weight, this.height, this.types,
      this.forms, this.sprites);

  factory PokemonDetails.fromJson(Map<String, dynamic> json){
  final int id = json['id'] as int;
  final String name = json['name'] as String;
  final int weight = json['weight'] as int;
  final int height = json['height'] as int;
  final Sprites sprites = json['sprites'] as Sprites;
  final List<Type> types = (json['types'] as List).map((e) => Type.fromJson(e as Map<String,dynamic>)).toList();
  final List<Form> forms =  (json['forms'] as List).map((e) => Form.fromJson(e as Map<String,dynamic>)).toList();
  return PokemonDetails(id, name, weight, height, types, forms, sprites);
  }
}

class Type {
  int slot;
  TypeClass type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: TypeClass.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}

class TypeClass {
  String name;
  String url;

  TypeClass({
    required this.name,
    required this.url,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Form {
  String name;
  String url;

  Form({
    required this.name,
    required this.url,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

