import 'package:get/get.dart';

import '../../../repository/i_repository.dart';

class CompController extends GetxController with StateMixin {
  final ITaskRepository _taskRepository;

  CompController(this._taskRepository);

  @override
  void onInit() {
    super.onInit();
    findTasks();
  }

  Future<void> findTasks() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _taskRepository.findAllTaskscompleted();
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar taferas'));
    }
  }
}
