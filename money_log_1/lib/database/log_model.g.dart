// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:hive/hive.dart';
import '../database/log_model.dart';


// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************



class LogAdapter extends TypeAdapter<Log> {
  @override
  final int typeId = 0;

  @override
  Log read(BinaryReader reader) {
    return Log(
      amount: reader.readDouble(),
      description: reader.readString(),
      category: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Log obj) {
    writer.writeDouble(obj.amount);
    writer.writeString(obj.description);
    writer.writeString(obj.category);
  }
}
