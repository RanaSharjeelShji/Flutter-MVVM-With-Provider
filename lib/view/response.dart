import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermvvm/model/secondmodel.dart';
import 'package:providermvvm/url/url.dart';
import 'package:providermvvm/view_model/createVM.dart';
import 'package:providermvvm/view_model/secondvm.dart';
import 'package:providermvvm/view_model/todo_viewmodel.dart';

class ViewScreen extends StatefulWidget {
  ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final postData = {};
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostDataViewModel>(context);
    ToDoViewModel toDoViewModel = context.watch<ToDoViewModel>();
    SecondModelViewModel getSecondModel = context.watch<SecondModelViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: salaryController,
            ),
            TextField(
              controller: ageController,
            ),
            Text(
                "Total items: ${toDoViewModel.receivedData.length.toString()}"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: getSecondModel.receivedData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    getSecondModel.receivedData[index].id.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                toDoViewModel.getToDoModel(ApiUrl.firstAPI);
              },
              child: const Text("Fetch Data"),
            ),
            ElevatedButton(
              onPressed: () {
                getSecondModel.getSecondFunction(ApiUrl.seocndAPI);
              },
              child: const Text("Second Model"),
            ),
            ElevatedButton(
              onPressed: () {
                final Map<String, dynamic> postData = {
                  'name': nameController.text,
                  'salary': salaryController.text,
                  'age': ageController.text,
                };
                Provider.of<PostDataViewModel>(context, listen: false)
                    .postData(postData, ApiUrl.postAPI);
              },
              child: const Text('Make POST Request'),
            ),
            Text("${viewModel.status}"),
            const Text(
              'Response Message:',
              style: TextStyle(fontSize: 18),
            ),
            if (viewModel.responseMessage == null)
              Text("Loading")
            else
              Text(
                '${viewModel.responseMessage}',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 2, 174, 45)),
              )
          ],
        ),
      ),
    );
  }
}
