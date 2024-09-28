// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../models/BannerModel.dart';
import 'basenotifire.dart';
import 'config.dart';

class BannerProvider extends Basenotifier {
  BannerModel bannerModel = BannerModel();

  Future getBannerAndroid() async {
    Response res = await dioclient
        .getRequest(apiEnd: bannerApiandroid, queryParameters: {});
    if (res.statusCode == 200) {
      bannerModel = BannerModel.fromJson(res.data);
    } else {}

    notifyListeners();
  }

  Future getBannerIos() async {
    Response res =
        await dioclient.getRequest(apiEnd: bannerApiIos, queryParameters: {});
    if (res.statusCode == 200) {
      bannerModel = BannerModel.fromJson(res.data);
    } else {}

    notifyListeners();
  }
}
