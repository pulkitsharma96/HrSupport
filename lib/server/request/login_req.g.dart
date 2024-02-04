// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      json['userName'] as String? ?? '',
      json['password'] as String? ?? '',
      json['deviceId'] as String? ?? '',
      json['deviceType'] as String? ?? 'android',
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
    };
