// ignore_for_file: file_names
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/MatchesResponse.dart';
import 'basenotifire.dart';
import 'config.dart';

class FixtureProvider extends Basenotifier {
  List<MatchesResponseModel> scoreList = [];

  Future getScore({required String tabelName}) async {
    Response res = await dioclient.getRequest(
        apiEnd: scoreApi,
        queryParameters: {
          "readdb": 'yes',
          "tablename": tabelName,
          "json": 'yes'
        });
    if (res.statusCode == 200) {
      scoreList = List.from(res.data as List)
          .map((e) => MatchesResponseModel.fromJson(e))
          .toList();
    } else {}

    notifyListeners();
  }
}
