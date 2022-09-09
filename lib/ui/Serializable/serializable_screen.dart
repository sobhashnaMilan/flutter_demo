import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/employee/Employe.dart';
import 'package:flutter_demo/util/app_logger.dart';

class SerializableClass extends StatefulWidget {
  const SerializableClass({Key? key}) : super(key: key);

  @override
  State<SerializableClass> createState() => _SerializableClassState();
}

class _SerializableClassState extends State<SerializableClass> {
  var arg = Get.arguments;

  @override
  void initState() {
    super.initState();

    Logger().d("SerializableCheckClass");
    Logger().d("${arg[0]}");
    Employee d = arg[0];
    Logger().d(d.fName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json Serializable")),
      body: const Center(child: Text('SerializableCheckClass')),
    );
  }
}
