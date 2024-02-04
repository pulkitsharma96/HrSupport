import 'package:json_annotation/json_annotation.dart';
import 'package:rms/server/response/roles_res.dart';


part 'login_res.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRes {
  LoginRes({
    required this.accessToken,
    this.refreshToken,
    required this.userName,
    required this.name,
    required this.userId,
    required this.roles,
  });

  @JsonKey(defaultValue: "")
  String? refreshToken;

  @JsonKey(defaultValue: "")
  String accessToken;

  @JsonKey(defaultValue: "")
  String userName;

  // interestList: [InterestDTO?]
  @JsonKey(defaultValue: "")
  String name;

  int? userId;

  @JsonKey(defaultValue: "")
  List<Roles> roles = [];

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResToJson(this);
}
