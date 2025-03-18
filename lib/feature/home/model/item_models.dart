class Recipe {
  String? uri;
  String? label;
  String? image;
  String? source;
  String? url;
  String? shareAs;
  num? recipeYield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<dynamic>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  double? calories;
  double? totalWeight;
  num? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  Map<String, Total>? totalNutrients;
  Map<String, Total>? totalDaily;
  List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  factory Recipe.fromJson(Map<dynamic, dynamic> json) => Recipe(
        uri: json['uri'],
        label: json['label'],
        image: json['image'],
        source: json['source'],
        url: json['url'],
        shareAs: json['shareAs'],
        recipeYield: json['yield'],
        dietLabels: List<String>.from(json['dietLabels'] ?? []),
        healthLabels: List<String>.from(json['healthLabels'] ?? []),
        cautions: json['cautions'] ?? [],
        ingredientLines: List<String>.from(json['ingredientLines'] ?? []),
        ingredients: (json['ingredients'] as List?)
            ?.map((e) => Ingredient.fromJson(e))
            .toList(),
        calories: (json['calories'] as num?)?.toDouble(),
        totalWeight: (json['totalWeight'] as num?)?.toDouble(),
        totalTime: json['totalTime'],
        cuisineType: List<String>.from(json['cuisineType'] ?? []),
        mealType: List<String>.from(json['mealType'] ?? []),
        dishType: List<String>.from(json['dishType'] ?? []),
        totalNutrients: (json['totalNutrients'] as Map<dynamic, dynamic>?)
            ?.map((k, v) => MapEntry(k, Total.fromJson(v))),
        totalDaily: (json['totalDaily'] as Map<dynamic, dynamic>?)
            ?.map((k, v) => MapEntry(k, Total.fromJson(v))),
        digest:
            (json['digest'] as List?)?.map((e) => Digest.fromJson(e)).toList(),
      );

  Map<dynamic, dynamic> toJson() => {
        'uri': uri,
        'label': label,
        'image': image,
        'source': source,
        'url': url,
        'shareAs': shareAs,
        'yield': recipeYield,
        'dietLabels': dietLabels,
        'healthLabels': healthLabels,
        'cautions': cautions,
        'ingredientLines': ingredientLines,
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'calories': calories,
        'totalWeight': totalWeight,
        'totalTime': totalTime,
        'cuisineType': cuisineType,
        'mealType': mealType,
        'dishType': dishType,
        'totalNutrients':
            totalNutrients?.map((k, v) => MapEntry(k, v.toJson())),
        'totalDaily': totalDaily?.map((k, v) => MapEntry(k, v.toJson())),
        'digest': digest?.map((e) => e.toJson()).toList(),
      };
}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  String? unit;
  List<Digest>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromJson(Map<dynamic, dynamic> json) => Digest(
        label: json['label'],
        tag: json['tag'],
        schemaOrgTag: json['schemaOrgTag'],
        total: (json['total'] as num?)?.toDouble(),
        hasRdi: json['hasRDI'],
        daily: (json['daily'] as num?)?.toDouble(),
        unit: json['unit'],
        sub: (json['sub'] as List?)?.map((e) => Digest.fromJson(e)).toList(),
      );

  Map<dynamic, dynamic> toJson() => {
        'label': label,
        'tag': tag,
        'schemaOrgTag': schemaOrgTag,
        'total': total,
        'hasRDI': hasRdi,
        'daily': daily,
        'unit': unit,
        'sub': sub?.map((e) => e.toJson()).toList(),
      };
}

class Ingredient {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory Ingredient.fromJson(Map<dynamic, dynamic> json) => Ingredient(
        text: json['text'],
        quantity: (json['quantity'] as num?)?.toDouble(),
        measure: json['measure'],
        food: json['food'],
        weight: (json['weight'] as num?)?.toDouble(),
        foodCategory: json['foodCategory'],
        foodId: json['foodId'],
        image: json['image'],
      );

  Map<dynamic, dynamic> toJson() => {
        'text': text,
        'quantity': quantity,
        'measure': measure,
        'food': food,
        'weight': weight,
        'foodCategory': foodCategory,
        'foodId': foodId,
        'image': image,
      };
}

class Total {
  String? label;
  double? quantity;
  String? unit;

  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  factory Total.fromJson(Map<dynamic, dynamic> json) => Total(
        label: json['label'],
        quantity: (json['quantity'] as num?)?.toDouble(),
        unit: json['unit'],
      );

  Map<dynamic, dynamic> toJson() => {
        'label': label,
        'quantity': quantity,
        'unit': unit,
      };
}
