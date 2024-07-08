import 'package:hive/hive.dart';
import '../database/log_model.dart';
import '../database/logsheet_model.dart';


class LogSheetAdapter extends TypeAdapter<LogSheet> {
  @override
  final int typeId = 1;

  @override
  LogSheet read(BinaryReader reader) {
    int logsheetLength = reader.readByte();
    List<Log> logsheet = [];
    for (int i = 0; i < logsheetLength; i++) {
      logsheet.add(reader.read() as Log);
    }
    double total = reader.readDouble();
    return LogSheet(logsheet: logsheet , total: total);
  }

  @override
  void write(BinaryWriter writer, LogSheet obj) {
    writer.writeByte(obj.logsheet.length);
    for (Log log in obj.logsheet) {
      writer.write(log);
    }
    writer.writeDouble(obj.total);
  }
}
