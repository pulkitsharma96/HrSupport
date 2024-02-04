import 'package:json_annotation/json_annotation.dart';

part 'roles_res.g.dart';

@JsonSerializable()
class Roles {
  @JsonKey(defaultValue: "")
  int? id;
  @JsonKey(defaultValue: "")
  String name;

  Roles({required this.id, required this.name});

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}
