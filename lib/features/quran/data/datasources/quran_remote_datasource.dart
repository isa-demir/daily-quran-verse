import 'dart:convert';

import 'package:daily_message/core/api/api_endpoints.dart';
import 'package:daily_message/core/api/base_api_service.dart';
import 'package:daily_message/core/exceptions/exception.dart';
import 'package:daily_message/features/quran/data/models/author_model.dart';
import 'package:daily_message/features/quran/data/models/surah_model.dart';

abstract class IQuranDatasource {
  Future<AuthorListModel> getAuthors();
  Future<SurahListModel> getSurahs();
}

class QuranRemoteDataSource implements IQuranDatasource {
  final _apiService = ApiService();

  @override
  Future<AuthorListModel> getAuthors() async {
    try {
      final resp =
          await _apiService.getRequest(endPoint: ApiEndpoints.getAuthors);

      final authorListModel = AuthorListModel.fromJson(resp.data);

      return authorListModel;
    } catch (e) {
      throw ServerException(message: 'Veriler alinamadi!');
    }
  }

  @override
  Future<SurahListModel> getSurahs() async {
    try {
      final resp =
          await _apiService.getRequest(endPoint: ApiEndpoints.getSurahs);

      final surahListModel = SurahListModel.fromJson(resp.data);

      return surahListModel;
    } catch (e) {
      throw ServerException(message: 'Veriler alinamadi!');
    }
  }
}
