import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:person_app/const/urls.dart';
import 'package:person_app/screen/app/profile/model/profile_model.dart';

class HomeNotifier extends ChangeNotifier {
  /* API Integration */
  List<UserModel> usersList = <UserModel>[UserModel(), UserModel()];
  bool isUserDataLoading = false;
  bool isUsersEmpty = false;
  Future<void> getUsersData({required BuildContext context}) async {
    try {
      isUserDataLoading = true;
      usersList.add(UserModel());
      usersList.add(UserModel());
      usersList.add(UserModel());
      usersList.add(UserModel());

      final response = await http.get(Uri.parse(Urls.usersUrl));
      if (response.statusCode == 200) {
        usersList.clear();
        List<dynamic> body = jsonDecode(response.body);
        final users = body.map((dynamic item) => UserModel.fromJson(item)).toList();
        usersList.addAll(users);

        if (usersList.isEmpty == true) {
          isUsersEmpty = true;
        } else {
          isUsersEmpty = false;
        }
      } else {
        usersList.clear();
        // Handle error
      }
    } catch (e) {
      usersList.clear();
      debugPrint(e.toString());
      // Handle error
    } finally {
      isUserDataLoading = false;
      notifyListeners();
    }
  }

  Future fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print("45656 body ${response.body}");
      usersList = body.map((dynamic item) => UserModel.fromJson(item)).toList();
    } else {
      throw "External API Error: ${response.statusCode}";
    }
  }
}
