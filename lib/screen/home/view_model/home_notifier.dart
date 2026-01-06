import 'package:flutter/material.dart';
import 'package:person_app/const/server_client.dart';
import 'package:person_app/const/urls.dart';
import 'package:person_app/screen/profile/model/profile_model.dart';

class HomeNotifier extends ChangeNotifier {
  /* API Integration */
  List<UserModel> searchableBase = []; // This will hold the "First 5"
  List<UserModel> displayUsers = [];
  List<UserModel> usersList = <UserModel>[];
  bool isUserDataLoading = false;
  bool isUsersEmpty = false;
  Future<void> getUsersData({required BuildContext context}) async {
    try {
      isUserDataLoading = true;
      displayUsers.add(UserModel());
      displayUsers.add(UserModel());
      displayUsers.add(UserModel());
      displayUsers.add(UserModel());

      final response = await ServerClient.get(Urls.usersUrl);
      if (response.first == 200) {
        List<dynamic> body = response.last;
        final users = body.map((dynamic item) => UserModel.fromJson(item as Map<String, dynamic>)).toList();
        if (users.length > 5) {
          displayUsers.clear();
          usersList = users.take(5).toList();
          displayUsers = users.take(5).toList();
        } else {
          usersList.addAll(users);
          displayUsers.addAll(users);
        }

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

  void searchUsers(String query) {
    if (query.isEmpty) {
      displayUsers.clear();
      displayUsers = usersList;
    } else {
      displayUsers = usersList.where((user) {
        final searchLower = query.toLowerCase();

        return user.name?.toLowerCase().contains(searchLower) == true ||
            user.username?.toLowerCase().contains(searchLower) == true ||
            user.company?.name?.toLowerCase().contains(searchLower) == true;
      }).toList();
    }
    notifyListeners();
  }
}
