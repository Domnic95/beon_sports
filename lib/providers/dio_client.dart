// ignore_for_file: empty_catches, unused_local_variable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, file_names, unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:dio/dio.dart';

// class CustomInterCeptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers = {
//       'Token':
//           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoLWJhY2tlbmQ6YXBwIiwic3ViIjoiZjFmNmExNWYtMjhjMy00MGQ1LWE4ZGEtOWE0NzM2ZTNhYTRjIn0.KaoF-TOiLSi_EyXoXwQNoCicBSpOtGZ3Y9U-bj_AFtA',
//       'X-RapidAPI-Key': '3e87d1e617mshfdaf01aac3b9d51p152408jsnf82b43bc97ef',
//       'X-RapidAPI-Host': 'd7-verify.p.rapidapi.com'
//     };

//     super.onRequest(options, handler);
//   }
// }

class Dioclient {
  Dio dio = Dio();
  // ..interceptors.add(CustomInterCeptor());

  // Future<dynamic> PostwithFormdata(
  //     {required String apiEnd, Map<String, dynamic>? data}) async {
  //   try {
  //     final res = await dio.post(
  //       apiEnd,
  //       data: data,
  //     );
  //     Responsemessage("Post", apiEnd, res);
  //     return res;
  //   } on DioError catch (e) {
  //     return e.response;
  //   } catch (e) {
  //     log("Post" + apiEnd + e.toString());
  //   }
  // }

  Future<dynamic> getRequest(
      {required String apiEnd, Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await dio.get(
        apiEnd,
        queryParameters: queryParameters,
      );
      // Responsemessage("get", apiEnd, res);
      return res;
    } on DioException catch (e) {
      log("Error=== ${e.error}");
      log("Message=== ${e.message}");
      log("Response=== ${e.response}");
      return e.response;
    }
  }
}

void Responsemessage(String urlType, String url, Response res) {
  log("-------------->  ${urlType} = ${url} <--------");
  log(res.toString());
}

// Future showSnackbar(BuildContext context, String text) async {
//   SnackBar snackBar = SnackBar(
//     content: Text(text),
//     duration: Duration(seconds: 2),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
