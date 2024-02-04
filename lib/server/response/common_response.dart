import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonRes {
  @JsonKey(defaultValue: "")
  String message;

  CommonRes(this.message);

  factory CommonRes.fromJson(Map<String, dynamic> json) =>
      _$CommonResFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResToJson(this);
}
