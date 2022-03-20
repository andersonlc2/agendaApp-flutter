import '../model/task_model.dart';

abstract class ITaskRepository {
  Future<List<TaskModel>> findAllTasks();
  Future<List<TaskModel>> findAllTasksIncompleted();
  Future<List<TaskModel>> findAllTaskscompleted();
  Future<TaskModel> findById(int id);
}
