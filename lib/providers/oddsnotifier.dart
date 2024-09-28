// ignore_for_file: file_names
import 'dart:developer';


import 'package:dio/dio.dart';

import '../models/OddsModel.dart';
import 'basenotifire.dart';
import 'config.dart';

class OddsProvider extends Basenotifier {
  List<ScroreModel> scoreList = [];

  Future getScore({required String tabelName}) async {
    Response res = await dioclient.getRequest(
        apiEnd: oddsApi,
        queryParameters: {
          "readdb": 'yes',
          "tablename": tabelName,
          "json": 'yes'
        });
    if (res.statusCode == 200) {
      scoreList = List.from(res.data as List)
          .map((e) => ScroreModel.fromJson(e))
          .toList();
    } else {}

    notifyListeners();
  }
}
