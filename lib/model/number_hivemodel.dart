import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NumberHiveModel extends HiveObject {
  @HiveField(0)
   int? number;
}
