import 'package:hive/hive.dart';
import 'package:todoapp/data/todolist.dart';

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo(
      task: reader.readString(),
      isCompleted: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer.writeString(obj.task);
    writer.writeBool(obj.isCompleted);
  }
}
