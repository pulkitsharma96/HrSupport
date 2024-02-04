// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      userId: json['userId'] as int?,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => Roles.fromJson(e as Map<String, dynamic>))
              .toList() ??
          List.empty(),
    );

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'userName': instance.userName,
      'name': instance.name,
      'userId': instance.userId,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
    };
