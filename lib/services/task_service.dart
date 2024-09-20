// lib/services/task_service.dart
import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    final newTask = Task(id: _tasks.length + 1, title: title);
    _tasks.add(newTask);
  }

  void removeTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  void toggleComplete(int id) {
    for (var task in _tasks) {
      if (task.id == id) {
        task.completed = !task.completed;
        break;
      }
    }
  }
}
