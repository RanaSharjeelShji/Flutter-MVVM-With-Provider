import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermvvm/view/response.dart';
import 'package:providermvvm/view_model/createVM.dart';
import 'package:providermvvm/view_model/secondvm.dart';
import 'package:providermvvm/view_model/todo_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToDoViewModel()),
        ChangeNotifierProvider(create: (_) => SecondModelViewModel()),
        ChangeNotifierProvider(create: (_) => PostDataViewModel()),
      ],
      child:  MaterialApp(
        home: ViewScreen(),
      ),
    ),
  );
}
