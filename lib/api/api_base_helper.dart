import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hobbits_worky/api/api_exceptions.dart';
import 'dart:async';

class ApiBaseHelper {
  //URL of the Reddit API to get the top 100 of all time 
  final String _baseUrl = "https://www.reddit.com/r/lotr/top/.json?limit=100&t=all";

  //Future to wait fot the API response
  Future<dynamic> get() async {
    var responseJson;

    try {
      final response = await http.get(_baseUrl);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

  //Return of the response in format Json (specified on the URL)
    return responseJson;
  }

}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
