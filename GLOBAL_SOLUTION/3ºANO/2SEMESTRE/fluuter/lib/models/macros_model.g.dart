// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macros_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MacrosModel _$MacrosModelFromJson(Map<String, dynamic> json) => MacrosModel(
      calorie: (json['calorie'] as num?)?.toDouble(),
      balanced: json['balanced'] == null
          ? null
          : NutritionalModel.fromJson(json['balanced'] as Map<String, dynamic>),
      lowfat: json['lowfat'] == null
          ? null
          : NutritionalModel.fromJson(json['lowfat'] as Map<String, dynamic>),
      lowcarbs: json['lowcarbs'] == null
          ? null
          : NutritionalModel.fromJson(json['lowcarbs'] as Map<String, dynamic>),
      highprotein: json['highprotein'] == null
          ? null
          : NutritionalModel.fromJson(
              json['highprotein'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MacrosModelToJson(MacrosModel instance) =>
    <String, dynamic>{
      'calorie': instance.calorie,
      'balanced': instance.balanced,
      'lowfat': instance.lowfat,
      'lowcarbs': instance.lowcarbs,
      'highprotein': instance.highprotein,
    };
