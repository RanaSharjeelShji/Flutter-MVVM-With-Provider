import 'dart:convert';
import 'package:http/http.dart' as http;

class GetApiServices {
  static Future<List<dynamic>> getDataFromApi(String apiUrl) async {
    try {
      var url = Uri.parse(apiUrl);
      var response = await http.get(url);
      print("API Response Status Code: ${response.statusCode}");
      print("API Response Body: ${response.body}");
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData is List) {
          return jsonData;
        } else if (jsonData.containsKey("todos")) {
          return jsonData["todos"] as List<dynamic>;
        } else {
          throw Exception("API response format is not recognized");
        }
      } else {
        throw Exception(
            "API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      print("An error occurred: $e");
      throw Exception("An error occurred: $e");
    }
  }

  static Future<dynamic> postDataToApi(String apiUrl, dynamic data) async {
    try {
      var url = Uri.parse(apiUrl);
      var jsonData = json.encode(data);
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', 
        },
        body: jsonData, 
      );
      print("API Response Status Code: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            "API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      print("An error occurred: $e");
      throw Exception("An error occurred: $e");
    }
  }
}
