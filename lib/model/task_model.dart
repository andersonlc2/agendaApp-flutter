import 'dart:convert';

class TaskModel {
  int? id;
  String? title;
  String? description;
  bool? completed;

  TaskModel(this.id, this.title, this.description, this.completed);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'completed': completed});

    return result;
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      map['id'].toInt() ?? 0,
      map['title'] ?? '',
      map['description'] ?? '',
      map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
