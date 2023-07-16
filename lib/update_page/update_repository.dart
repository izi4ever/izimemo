import 'package:dio/dio.dart';
import 'package:izimemo/update_page/update_model.dart';

class UpdateRepository {
  Future<UpdateModel?> checkRepository() async {
    try {
      final response = await Dio().get('https://izi4ever.github.io/json/izimemo_update.json');
      UpdateModel? updateModel = UpdateModel.fromJson(response.data);
      return updateModel;
    } catch (e) {
      print('>>> error loading update data: $e');
      return null;
    }
  }
}
