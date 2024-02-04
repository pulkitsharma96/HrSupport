import 'package:json_annotation/json_annotation.dart';

part 'login_req.g.dart';

@JsonSerializable()
class LoginReq {
  LoginReq(this.userName, this.password, this.deviceId, this.deviceType);

  @JsonKey(defaultValue: "")
  String userName;

  @JsonKey(defaultValue: "")
  String password;

  @JsonKey(defaultValue: "")
  String deviceId;

  @JsonKey(defaultValue: "android")
  String deviceType;

  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      _$LoginReqFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}
