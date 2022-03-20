import 'dart:convert';

import 'package:lista_tarefas/model/task_model.dart';
import 'package:http/http.dart' as http;

import '../../repository/i_repository.dart';

class TaskHttpRepository implements ITaskRepository {
  @override
  Future<List<TaskModel>> findAllTasks() async {
    final response = await http
        .get(Uri.parse('https://app-agend-todo.herokuapp.com/api/todos/'));
    final List<dynamic> responseMap = jsonDecode(response.body);

    return responseMap
        .map<TaskModel>((resp) => TaskModel.fromMap(resp))
        .toList();
  }
}
