// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      fName: json['firstName'] as String,
      lName: json['lastName'] as String,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'firstName': instance.fName,
      'lastName': instance.lName,
    };
