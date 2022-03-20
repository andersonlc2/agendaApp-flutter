import 'package:get/get.dart';

import '../../../repository/i_repository.dart';

class ImcompController extends GetxController with StateMixin {
  final ITaskRepository _taskRepository;

  ImcompController(this._taskRepository);

  @override
  void onInit() {
    super.onInit();
    findTasks();
  }

  Future<void> findTasks() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _taskRepository.findAllTasksIncompleted();
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar taferas'));
    }
  }
}
