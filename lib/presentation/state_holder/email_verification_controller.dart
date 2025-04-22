import 'package:crafty_bay_ecommerce_flutter/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce_flutter/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce_flutter/data/urls/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationInProgress = false;
  String _message = '';

  bool get emailVerificationInProgress => _emailVerificationInProgress;
  String get message => _message;

  Future<bool> verifyEmail(String email) async {
    _emailVerificationInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      _message = 'Email verification successful!';
      return true;
    } else {
      _message = 'Email verification failed';
      return false;
    }
  }
}