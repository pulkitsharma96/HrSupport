// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReq _$SignUpReqFromJson(Map<String, dynamic> json) => SignUpReq(
      json['fullName'] as String? ?? '',
      json['userName'] as String? ?? '',
      json['gender'] as String? ?? '',
      json['dob'] as String? ?? '',
      json['emailId'] as String? ?? '',
      json['password'] as String? ?? '',
      json['phoneNo'] as String? ?? '',
      (json['roles'] as List<dynamic>?)
              ?.map((e) => Roles.fromJson(e as Map<String, dynamic>))
              .toList() ??
          List.empty(),
    );

Map<String, dynamic> _$SignUpReqToJson(SignUpReq instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'userName': instance.userName,
      'gender': instance.gender,
      'dob': instance.dob,
      'emailId': instance.emailId,
      'password': instance.password,
      'phoneNo': instance.phoneNo,
      'roles': instance.roles,
    };
