import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutritional_model.g.dart';

@JsonSerializable()
class NutritionalModel extends Equatable {
  final double? protein;
  final double? fat;
  final double? carbs;

  const NutritionalModel({
    this.protein,
    this.fat,
    this.carbs,
  });

  factory NutritionalModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionalModelFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionalModelToJson(this);

  @override
  List<Object?> get props => [
        protein,
        fat,
        carbs,
      ];
}
