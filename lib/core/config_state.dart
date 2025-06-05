import 'package:flutter/cupertino.dart';
import 'package:modelo_app_flutter_20251/core/preference-store-interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';


class ConfigState {
  static const STORE_URL_KEY = 'URL';
  static const STORE_TOKEY_KEY = 'TOKEN';
  final url = signal('');
  final token = signal('');
  bool disposeCtrl = false;
  ConfigState({required this.prefs}) {
    loadPreferencesStateValues();
    configureAutoSaveToConfigState();
  }

  void configureAutoSaveToConfigState() {
    url.subscribe((value) {
      if(disposeCtrl == false && value != "") {
        prefs.write(STORE_URL_KEY, value);
        debugPrint("set-URL:${url()}");
      }
    });

    token.subscribe((value) {
      if(disposeCtrl == false && value != ""){
        prefs.write(STORE_TOKEY_KEY, value);
        debugPrint("set-TOKEN:${token()}");
      }
    });
  }

  void loadPreferencesStateValues() {
    prefs.read(STORE_URL_KEY).then((value) {
      url.set(value != '' ? value : 'http://192.168.100.1:8080');
    });
    prefs.read(STORE_TOKEY_KEY).then((value) {
      if(value!="") {
        token.set(value);
      }
    });
  }
  final PreferenceStore prefs;
  dispose(){
    disposeCtrl = true;
    debugPrint("prefs-dispose-url:${url()}");
    debugPrint("prefs-dispose-token:${token()}");
    url.dispose();
    token.dispose();
  }
}