
import 'package:flutter/material.dart';
import 'package:providermvvm/model/todomodel.dart';
import 'package:providermvvm/services/services.dart';
class ToDoViewModel extends ChangeNotifier {
  List<TodoModel> _receivedData = [];

  List<TodoModel> get receivedData => _receivedData;

  setTodoModel(List<TodoModel> receivedData) {
    _receivedData = receivedData;
    notifyListeners();
  }

  ToDoViewModel();

Future<void> getToDoModel(String apiUrl) async {
  try {
    var response = await GetApiServices.getDataFromApi(apiUrl);
    if (response is List<dynamic>) {
      List<TodoModel> todoList = response.map((json) => TodoModel.fromJson(json)).toList();
      setTodoModel(todoList);
      print("ViewModel data loaded");
    } else {
      print('API request failed');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}


}
