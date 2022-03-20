import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../repository/i_repository.dart';

class EditPageFormController extends GetxController with StateMixin {
  var id = 4.obs;

  Future<void> findTasks() async {
    final dados = await http
        .get(Uri.parse('https://app-agend-todo.herokuapp.com/api/todos/4/'));
    print(dados);
  }
}


/*
class EditPageFormController extends GetxController with StateMixin {
  final ITaskRepository _taskRepository;

  EditPageFormController(this._taskRepository);

  @override
  void onInit() {
    super.onInit();
    findTasks();
  }

  Future<void> findTasks() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _taskRepository.findById(4);
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar taferas'));
    }
  }
}
*/