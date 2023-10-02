import 'package:flutter/material.dart';
import 'package:providermvvm/services/services.dart';

class PostDataViewModel extends ChangeNotifier {
  String? _responseMessage;
  String? _status;

  String? get responseMessage => _responseMessage;
  String? get status => _responseMessage;

  Future<void> postData(Map<String, dynamic> data, String postAPI) async {
    try {
      var response = await GetApiServices.postDataToApi(postAPI, data);

      _responseMessage = "POST request successful: $response";
      notifyListeners();
      
    } catch (e) {
      _responseMessage = "POST request failed: $e";
      notifyListeners();
      
    }
  }
}
