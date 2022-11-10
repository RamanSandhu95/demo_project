
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newproject/constant/string_constant.dart';


/*
* this method is used for call post api
* required param //
 *  body
 *  api endpoint
* //
* optional param //
* bool isToken
* String token
* bool isFullUrl
* //
 */
Future<dynamic> callPostApi(Map<String, dynamic> body, String endPoint,
    {bool isToken = false,
      String? token,
      bool isFullUrl = false,
      bool isFormData = true}) async {
  /// todo print the value of baseUrl+apiEndpoint
  print('URL Request ------------------------------->\n $baseUrl$endPoint');
  print('API Request ------------------------------->\n ${jsonEncode(body)}');
  final withToken = {
    "Authorization": 'Bearer $token',
  };
  /// request type
  if (!isFormData) {
    withToken.addAll({
      "Content-Type": "application/json",
    });
  }
  print(
      'API Request Header ------------------------------->\n ${jsonEncode(withToken)}');

  try {
    final response = await http.post(
      Uri.parse(isFullUrl ? endPoint : '$baseUrl$endPoint'),
      headers: withToken,
      body: isFormData ? body : jsonEncode(body),
    );

    String finalResponse = response.body;

    print('API response ------------------------------->\n $finalResponse');
    print(
        'API request Header ------------------------------->\n ${response.headers}');
    /// todo checking response status code
    if (response.statusCode == 200) {
      return jsonDecode(finalResponse);
    } else if (response.statusCode == 404) {
    } else {
      return jsonDecode(finalResponse);
    }
  } catch (e) {
    /// todo printing exception
    print('$e');
  }

 // This method is used to get api request
  Future<dynamic> callGetApi(String endPoint, {String token = ''}) async {
    try {
      print(
          'URL Request ------------------------------->url\n $endPoint');

      print('token ------------------>\n $token');
      final response = await http.get(
        Uri.parse('$baseUrl$endPoint'),
        headers: {
          // "Content-Type": "application/json",
          "Authorization": "Bearer ${token}" ,
        },
      );
      String finalResponse = response.body;
      print(
          'endPoint API request header ------------------>\n ${response.headers}');
      print('endPoint API response ------------------>\n $finalResponse');
      return jsonDecode(finalResponse);
    } catch (e) {
      print('$e');
    }
  }
}