import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/Data/Network/app_exceptions.dart';
import 'package:pokedex/Data/Network/base_api_services.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    // print('Response Status Code: ${response.statusCode}');
    // print('Response Headers: ${response.headers}');
    print('Response Body: ${response.body}');
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException('Error ${response.statusCode}');
    }
  }

  @override
  Future getApi(String url) async {
    try {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      return jsonResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('Request time out');
    } on SocketException {
      throw InternetException('No Internet');
    }
  }
}
