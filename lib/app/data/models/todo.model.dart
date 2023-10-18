import 'package:json_annotation/json_annotation.dart';

part 'todo.model.g.dart';

@JsonSerializable()
class TodoModel {
  int? id;
  String name;
  bool isCompleted;
  DateTime creatAt;
  TodoModel({
     this.id,
    required this.name,
    required this.isCompleted,
    required this.creatAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
