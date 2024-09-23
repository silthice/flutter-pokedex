import 'package:pokedex/Data/Network/api_services.dart';
import 'package:pokedex/Resources/AppUrl/app_url.dart';

class PokemonDetailRepository {
  static Future<dynamic> getDescription(int id) async {
    var urlById = '${AppUrl.baseUrl}/pokemon-species/$id';
    var response = await ApiServices().getApi(urlById);
    return response;
  }
}
