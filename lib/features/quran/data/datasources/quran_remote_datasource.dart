import 'dart:convert';

import 'package:daily_message/core/api/api_endpoints.dart';
import 'package:daily_message/core/api/base_api_service.dart';
import 'package:daily_message/features/quran/data/models/author_model.dart';

abstract class IQuranRemoteDatasource {
  Future<AuthorListModel> getAuthors();
}

class QuranRemoteDataSource implements IQuranRemoteDatasource {
  final _apiService = ApiService();

  @override
  Future<AuthorListModel> getAuthors() async {
    try {
      final resp =
          await _apiService.getRequest(endPoint: ApiEndpoints.getAuthors);

      final authorListModel = AuthorListModel.fromJson(jsonDecode(resp.data));

      return authorListModel;
    } catch (e) {
      throw Exception();
    }
  }
}
