import 'package:flutter/material.dart';
import 'package:providermvvm/model/secondmodel.dart';
import 'package:providermvvm/services/services.dart';
class SecondModelViewModel extends ChangeNotifier {
  List<UserModel> _receivedData = [];

  List<UserModel> get receivedData => _receivedData;

  setSecondModel(List<UserModel> receivedData) {
    _receivedData = receivedData;
    notifyListeners();
  }

  SecondModelViewModel();

  Future<void> getSecondFunction(String apiUrl) async {
    try {
      var response = await GetApiServices.getDataFromApi(apiUrl);
      if (response is List<dynamic>) {
        // Assuming the response is a list of JSON objects representing users
        List<UserModel> userModel = response
            .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
            .toList();
        setSecondModel(userModel);
      } else {
        print('API request failed');
      }
      print("ViewModel data loaded");
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
