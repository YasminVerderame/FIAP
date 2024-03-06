import 'package:dio/dio.dart';
import 'package:macros_amounts/models/macros_model.dart';

Future<MacrosModel?> getMacros({
  String? gender,
  int? age,
  int? height,
  int? weight,
  String? activityLevel,
  String? goal,
}) async {
  try {
    final options = BaseOptions(
      baseUrl: 'https://fitness-calculator.p.rapidapi.com',
      headers: {
        'X-RapidAPI-Key': 'ad671243cemsh3e9441a80f5d7b5p181640jsnafac28036a1f',
        'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com',
      },
    );

    final Dio dio = Dio(options);
    final response = await dio.get(
      '/macrocalculator',
      queryParameters: {
        'age': '$age',
        'gender': '$gender',
        'height': '$height',
        'weight': '$weight',
        'activitylevel': '$activityLevel',
        'goal': '$goal',
      },
    );
    return MacrosModel.fromJson(response.data['data']);
  } on DioException catch (error) {
    print('Erro ao realizar get ${error.response?.statusCode}');
    throw Exception('Falha ao Carregar Dados');
  }
}
