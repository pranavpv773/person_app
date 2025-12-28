import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/urls.dart';
import 'package:person_app/screen/profile/model/profile_model.dart';

class ProfileNotifier extends ChangeNotifier {
  /* API Integration */
  List<UserModel> usersList = <UserModel>[UserModel(), UserModel()];
  bool isUserDataLoading = false;
  bool isUsersEmpty = false;
  Future<void> getUsersData({required BuildContext context}) async {
    print('getuser');
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
        usersList.addAll(tempUsersList);
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

  /* Search Functionality */
  TextEditingController searchController = TextEditingController();

  bool isSearchEnabled = false;

  List<UserModel> displayUsers = [];

  // Call this when user types in search bar
  void searchUsers() {
    print("object 1");
    if (searchController.text.isEmpty) {
      print("object");
      isSearchEnabled = false;
      displayUsers.clear();
      displayUsers = usersList;
      notifyListeners();
    } else {
      isSearchEnabled = true;
      notifyListeners();
      displayUsers = usersList.where((user) {
        final searchLower = searchController.text.trim().toLowerCase();

        // Match against Name, Username, or Company Name
        return user.name?.toLowerCase().contains(searchLower) == true ||
            user.username?.toLowerCase().contains(searchLower) == true ||
            user.company?.name?.toLowerCase().contains(searchLower) == true;
      }).toList();
    }
    notifyListeners();
  }

  List<UserModel> tempUsersList = [];
  Future<void> addToList(UserModel user, BuildContext context) async {
    try {
      tempUsersList.add(user);
      toast(context, title: 'Profile Added successFully', backgroundColor: AppColor.green);
    } catch (e) {
      print('error on adding $e');
    }
  }
}
