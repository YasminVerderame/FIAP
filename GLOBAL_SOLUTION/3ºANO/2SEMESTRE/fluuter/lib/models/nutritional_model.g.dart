// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritional_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionalModel _$NutritionalModelFromJson(Map<String, dynamic> json) =>
    NutritionalModel(
      protein: (json['protein'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      carbs: (json['carbs'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NutritionalModelToJson(NutritionalModel instance) =>
    <String, dynamic>{
      'protein': instance.protein,
      'fat': instance.fat,
      'carbs': instance.carbs,
    };
