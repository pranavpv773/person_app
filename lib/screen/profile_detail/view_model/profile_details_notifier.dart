import 'package:flutter/material.dart';
import 'package:person_app/screen/profile/model/profile_model.dart';

class ProfileDetailsNotifier extends ChangeNotifier {
  UserModel user = UserModel();

  void setUserModel(UserModel data) {
    user = data;
    notifyListeners();
  }
}
