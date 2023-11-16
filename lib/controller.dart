import 'package:flutter/material.dart';
import 'package:hive_crud/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homecontroller with ChangeNotifier {
  List<DataModel> dataList = [];

  var box = Hive.box<DataModel>('myBox');

//add data to box
  addData(DataModel dataModel) async {
    await box.add(dataModel);
    print("data added");
    notifyListeners();
  }

//get data to box
  getData() async {
    dataList = await box.values.toList();
    notifyListeners();
  }

//delete data to box
  daleteData(int index) async {
    await box.deleteAt(index);
  }

//update data to box
  updateData(int index, DataModel datamodel) async {
    await box.putAt(index, datamodel);
    notifyListeners();
  }
}
