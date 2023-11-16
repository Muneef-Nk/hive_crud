import 'package:flutter/material.dart';
import 'package:hive_crud/controller.dart';
import 'package:hive_crud/home.dart';
import 'package:hive_crud/model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(DataModelAdapter());

  await Hive.initFlutter();
  await Hive.openBox<DataModel>('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homecontroller(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
