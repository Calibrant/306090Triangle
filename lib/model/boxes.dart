import 'package:hive/hive.dart';

import '../core/key.dart';
import 'number_hivemodel.dart';

class Boxes {  
  static Box<NumberHiveModel> getNumberModel() =>
      Hive.box<NumberHiveModel>(IKey.numberKey);
}