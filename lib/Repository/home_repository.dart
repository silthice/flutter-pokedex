import 'package:pokedex/Data/Network/api_services.dart';
import 'package:pokedex/Resources/AppUrl/app_url.dart';

class HomeRepository {
  static Future<dynamic> getPokemonList(int offset) async {
    var url = '${AppUrl.baseUrl}/pokemon?limit=10&offset=${offset.toString()}';
    var response = await ApiServices().getApi(url);
    return response;
  }

  static Future<dynamic> getPokemonDetail(String url, {int? id}) async {
    var urlById = '${AppUrl.baseUrl}/pokemon';
    if (id != null) {
      urlById + id.toString();
    }
    var response = await ApiServices().getApi(id != null ? urlById : url);
    return response;
  }
}
