import 'package:get/get.dart';
import 'package:lista_tarefas/home/repository/task_controller.dart';
import 'package:lista_tarefas/home/repository/task_repository.dart';
import 'package:lista_tarefas/repository/i_repository.dart';

class TaskBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ITaskRepository>(TaskHttpRepository());
    Get.put(TaskController(Get.find()));
  }
}
