import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';
import 'dart:convert';

class LearningService {
  final ApiInterceptor _apiInterceptor = ApiInterceptor();

  //Get Categories by user and region
  // /Learn/region/2/categories
  Future<HttpBaseResponse> getCategoriesByUserAndRegion(int regionId) async {
    try {
      final response =
          await _apiInterceptor.get('/Learn/region/$regionId/categories');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }

  // Get Category Detail
  // /Learn/category/2
  Future<HttpBaseResponse> getCategoryDetail(int id) async {
    try {
      final response = await _apiInterceptor.get('/Learn/category/$id');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }

  //{{LOCAL_URL_BACK}}/api/file/mobile_backgrounds
  Future<HttpBaseResponse> getBackgrounds() async {
    try {
      final response = await _apiInterceptor.get('/file/mobile_backgrounds');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            data: decodedData,
            message: 'Fondos obtenidos correctamente',
            detail: null);
      }
      return HttpBaseResponse(
          code: 400,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }
}
