
import 'package:test/test.dart';
import '../lib/models/task.dart';

void main() {
  test('Task model should initialize correctly', () {
    final task = Task(id: 1, title: 'Test Task');

    expect(task.id, 1);
    expect(task.title, 'Test Task');
    expect(task.completed, isFalse); // The completed field should default to false
  });
}


