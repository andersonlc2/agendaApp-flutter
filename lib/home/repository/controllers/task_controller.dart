import 'package:get/get.dart';

import '../../../repository/i_repository.dart';

class TaskController extends GetxController with StateMixin {
  final ITaskRepository _taskRepository;

  TaskController(this._taskRepository);

  @override
  void onInit() {
    super.onInit();
    findTasks();
  }

  Future<void> findTasks() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _taskRepository.findAllTasks();
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar taferas'));
    }
  }
}
