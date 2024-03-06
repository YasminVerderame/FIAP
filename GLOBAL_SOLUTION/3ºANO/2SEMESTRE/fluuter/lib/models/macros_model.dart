import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:macros_amounts/models/nutritional_model.dart';

part 'macros_model.g.dart';

@JsonSerializable()
class MacrosModel extends Equatable {
  final double? calorie;
  final NutritionalModel? balanced;
  final NutritionalModel? lowfat;
  final NutritionalModel? lowcarbs;
  final NutritionalModel? highprotein;

  const MacrosModel({
    this.calorie,
    this.balanced,
    this.lowfat,
    this.lowcarbs,
    this.highprotein,
  });

  factory MacrosModel.fromJson(Map<String, dynamic> json) =>
      _$MacrosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MacrosModelToJson(this);

  @override
  List<Object?> get props => [
        calorie,
        balanced,
        lowfat,
        lowcarbs,
        highprotein,
      ];
}
