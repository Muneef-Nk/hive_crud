import 'package:flutter/material.dart';
import 'package:hive_crud/controller.dart';
import 'package:hive_crud/model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<Homecontroller>(context, listen: false).getData();
    super.initState();
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Homecontroller>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 400,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: "enter somthing"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<Homecontroller>(context, listen: false)
                            .addData(DataModel(name: _controller.text));

                        Provider.of<Homecontroller>(context, listen: false)
                            .getData();
                        setState(() {
                          Navigator.of(context).pop();
                          _controller.clear();
                        });
                      },
                      child: Text("add"))
                ]),
              );
            });
      }),
      body: ListView.builder(
          itemCount: provider.dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          _controller.text =
                              Provider.of<Homecontroller>(context)
                                  .dataList[index]
                                  .name;
                          return Container(
                            height: 400,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      hintText: "enter somthing"),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Provider.of<Homecontroller>(context,
                                            listen: false)
                                        .updateData(index,
                                            DataModel(name: _controller.text));

                                    Provider.of<Homecontroller>(context,
                                            listen: false)
                                        .getData();
                                    setState(() {
                                      Navigator.of(context).pop();
                                      _controller.clear();
                                    });
                                  },
                                  child: Text("add"))
                            ]),
                          );
                        });
                  },
                  child: Icon(Icons.edit)),
              title: Text(provider.dataList[index].name),
              trailing: GestureDetector(
                onTap: () {
                  print("deleted successfully");
                  Provider.of<Homecontroller>(context, listen: false)
                      .daleteData(index);

                  Provider.of<Homecontroller>(context, listen: false).getData();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.amber,
                ),
              ),
            );
          }),
    );
  }
}
