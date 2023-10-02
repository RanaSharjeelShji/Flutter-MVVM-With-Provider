import 'package:flutter/material.dart';
import 'package:providermvvm/model/commentModel.dart';
import 'package:providermvvm/model/secondmodel.dart';
import 'package:providermvvm/services/services.dart';
class SecondModelViewModel extends ChangeNotifier {
  List<CommentsModel> _receivedData = [];

  List<CommentsModel> get receivedData => _receivedData;

  setSecondModel(List<CommentsModel> receivedData) {
    _receivedData = receivedData;
    notifyListeners();
  }

  SecondModelViewModel();

  Future<void> getSecondFunction(String apiUrl) async {
    try {
      var response = await GetApiServices.getDataFromApi(apiUrl);
      if (response is List<dynamic>) {
        // Assuming the response is a list of JSON objects representing users
        List<CommentsModel> userModel = response
            .map((json) => CommentsModel.fromJson(json as Map<String, dynamic>))
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
