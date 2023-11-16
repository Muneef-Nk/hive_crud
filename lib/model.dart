import 'package:hive_flutter/hive_flutter.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  final String name;

  DataModel({required this.name});
}
