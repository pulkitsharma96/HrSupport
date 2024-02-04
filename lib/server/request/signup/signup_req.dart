import 'package:json_annotation/json_annotation.dart';

import '../../response/roles_res.dart';

part 'signup_req.g.dart';

@JsonSerializable()
class SignUpReq {
  @JsonKey(defaultValue: "")
  String fullName;
  @JsonKey(defaultValue: "")
  String userName;
  @JsonKey(defaultValue: "")
  String gender;
  @JsonKey(defaultValue: "")
  String dob;
  @JsonKey(defaultValue: "")
  String emailId;
  @JsonKey(defaultValue: "")
  String password;
  @JsonKey(defaultValue: "")
  String phoneNo;
  @JsonKey(defaultValue: "")
  List<Roles> roles = [];

  SignUpReq(this.fullName, this.userName, this.gender,
      this.dob, this.emailId, this.password, this.phoneNo, this.roles);

  factory SignUpReq.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpReqToJson(this);
}
