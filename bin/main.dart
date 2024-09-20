import 'dart:io';
import 'package:riverpod/riverpod.dart';
import '../lib/providers/task_provider.dart';
import '../lib/services/task_service.dart';
import '../lib/models/task.dart';

void main() {
  final container = ProviderContainer();
  final taskService = container.read(taskServiceProvider);

  print('Welcome to the To-Do List App!');
  while (true) {
    print('\nChoose an option:');
    print('1. View all tasks');
    print('2. Add a new task');
    print('3. Remove a task');
    print('4. Toggle task completion');
    print('5. Exit');

    var choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        _viewTasks(taskService);
        break;
      case '2':
        _addTask(taskService);
        break;
      case '3':
        _removeTask(taskService);
        break;
      case '4':
        _toggleTaskCompletion(taskService);
        break;
      case '5':
        exit(0);
      default:
        print('Invalid option! Please try again.');
    }
  }
}

void _viewTasks(TaskService taskService) {
  if (taskService.tasks.isEmpty) {
    print('No tasks available.');
  } else {
    for (Task task in taskService.tasks) {
      print(task);
    }
  }
}

void _addTask(TaskService taskService) {
  print('Enter task title:');
  String? title = stdin.readLineSync();
  if (title != null && title.isNotEmpty) {
    taskService.addTask(title);
    print('Task added successfully!');
  } else {
    print('Title cannot be empty.');
  }
}

void _removeTask(TaskService taskService) {
  print('Enter the task ID to remove:');
  var id = int.tryParse(stdin.readLineSync() ?? '');
  if (id != null) {
    taskService.removeTask(id);
    print('Task removed successfully!');
  } else {
    print('Invalid ID.');
  }
}

void _toggleTaskCompletion(TaskService taskService) {
  print('Enter the task ID to toggle completion:');
  var id = int.tryParse(stdin.readLineSync() ?? '');
  if (id != null) {
    taskService.toggleComplete(id);
    print('Task status updated!');
  } else {
    print('Invalid ID.');
  }
}
