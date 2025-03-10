import 'package:dio/dio.dart';
import 'package:recipie/feature/home/model/item_models.dart';

class RecipeApiService {
  static final Dio _dio = Dio();

  static Future<List<Recipe>> getRecipes(String query) async {
    try {
      final response = await _dio.get(
          'https://api.edamam.com/search?q=$query&app_id=b4569f96&app_key=2859517f694e1ed605f5a9e8829e80ca&from=0&to=10');
      if (response.statusCode == 200) {
        final data = response.data['hits'] as List;
        List<Recipe> recipes =
            data.map((e) => Recipe.fromJson(e['recipe'])).toList();
        return recipes;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load : $e');
    }
  }
}
