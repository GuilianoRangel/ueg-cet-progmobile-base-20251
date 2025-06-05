import 'package:collegeapi/collegeapi.dart';
import 'package:modelo_app_flutter_20251/core/config_state.dart';
import 'package:signals/signals.dart';

import 'package:dio/dio.dart';

class AppApi {
  ConfigState config;
  late Collegeapi api;
  AppApi({required this.config}){

    api = _createApiClient(basePath: this.config.url.value);

    this.config.url.subscribe((value) {
      print("value:"+value);
      api.dio.options.baseUrl = value;
    });

  }
  _createApiClient({required String basePath}){
    return Collegeapi(basePathOverride: basePath,
        interceptors: [
          InterceptorsWrapper(onRequest: (options, handler) {
            if(this.config.token.value!="") {
              options.headers['Authorization'] = 'Bearer ${config.token.value}';
            }
            return handler.next(options);
          })
        ]);
  }

  dispose() async {
    this.config.dispose();;
  }
}