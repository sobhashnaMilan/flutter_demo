import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/responsive_util.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../util/app_logger.dart';
import '../style/components/app_bar_component.dart';


class Credentials extends Equatable {
  const Credentials({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];

  @override
  bool get stringify => false;
}

class Person {
  Person(this.name);

  final String name;
}

@JsonSerializable()
class Emp {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  Emp({required this.firstName, required this.lastName});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Emp.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

class Work {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  Work({required this.firstName, required this.lastName});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Work.fromJson(Map<String, dynamic> json) => Work(
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
      );

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}

class EquatableDemo extends StatefulWidget {
  const EquatableDemo({Key? key}) : super(key: key);

  @override
  State<EquatableDemo> createState() => _EquatableDemoState();
}

class _EquatableDemoState extends State<EquatableDemo> {
  @override
  void initState() {
    super.initState();
    const credentialsA = Credentials(username: 'ok', password: 'ab123');
    const credentialsB = Credentials(username: 'okGoogle', password: 'abc');
    const credentialsC = Credentials(username: 'okGoogle', password: 'abc');
    var personA = Person("String");
    var personC = Person('okGoogle');
    var personB = Person('okGoogle');
    Logger().d((credentialsA == credentialsA).toString());
    Logger().d((credentialsB == credentialsB).toString());
    Logger().d(credentialsA.toString());
    Logger().d((credentialsC == credentialsC).toString());
    Logger().d((credentialsA == credentialsB).toString());
    Logger().d((credentialsB == credentialsC).toString());

    Logger().d((personA.hashCode).toString());
    Logger().d((personB.hashCode).toString());
    Logger().d((personC.hashCode).toString());
    Logger().d((personA == personB).toString());
    Logger().d((personB == personC).toString());
    Logger().d((personA == personC).toString());
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
        appBar: AppBarComponent.buildAppbar(
          titleWidget: Text(
            StringConstant.btnEquatableDemo.tr,
            style: deviceType == DeviceType.mobile
                ? white100Medium24TextStyle(context)
                : white100Medium10TextStyle(context),
          ),
        ),
        body: Column(
          children: [
            Center(child: Text("EquatableDemo")),
            ElevatedButton(
                onPressed: () {
                  var d = Emp(firstName: "EmpAgile", lastName: "EmpName");
                  Get.to(SerializableCheckClass(), arguments: [d]);
                },
                child: Text("Emp")),
            ElevatedButton(
                onPressed: () {
                  var d = Work(firstName: "WorkAgile", lastName: "WorkName");
                  Get.to(SerializableCheckClass(), arguments: [d]);
                },
                child: Text("Work"))
          ],
        ));
  }
}

class SerializableCheckClass extends StatefulWidget {
  const SerializableCheckClass({Key? key}) : super(key: key);

  @override
  State<SerializableCheckClass> createState() => _SerializableCheckClassState();
}

class _SerializableCheckClassState extends State<SerializableCheckClass> {
  var arg = Get.arguments;

  @override
  void initState() {
    super.initState();

    Logger().d("SerializableCheckClass");
    Logger().d("${arg[0]}");
    Work d = arg[0];
    Logger().d("${d.firstName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json Serializable")),
    );
  }
}
