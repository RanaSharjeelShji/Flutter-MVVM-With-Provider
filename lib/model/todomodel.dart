class TodoModel {
  List<TodoModel>? todos;
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.todos, this.userId, this.id, this.title, this.completed});

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];

    // Parse the "todos" array and create a list of TodoModel objects
    if (json['todos'] is List) {
      todos = (json['todos'] as List<dynamic>)
          .map((todoJson) => TodoModel.fromJson(todoJson))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    
    // Serialize the "todos" list if it's not null
    if (this.todos != null) {
      data['todos'] = this.todos!.map((todo) => todo.toJson()).toList();
    }
    
    return data;
  }
}
