import 'package:flutter/material.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/screen/app/profile/model/profile_model.dart';

class AddProfileNotifier extends ChangeNotifier {
  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController suiteController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  void addPersonFn(BuildContext context) {
    if (nameController.text.isEmpty) {
      toast(context, title: 'Profile name is required', backgroundColor: AppColor.red);
      return;
    }
    if (userNameController.text.isEmpty) {
      toast(context, title: 'User name is required!', backgroundColor: AppColor.red);
      return;
    }
    if (emailController.text.isEmpty) {
      toast(context, title: 'Email is required!', backgroundColor: AppColor.red);
      return;
    }
    if (phoneController.text.isEmpty) {
      toast(context, title: 'Phone number is required!', backgroundColor: AppColor.red);
      return;
    }

    if (suiteController.text.isEmpty) {
      toast(context, title: 'Suite is required', backgroundColor: AppColor.red);
      return;
    }
    if (cityController.text.isEmpty) {
      toast(context, title: 'City is required!', backgroundColor: AppColor.red);
      return;
    }
    if (streetController.text.isEmpty) {
      toast(context, title: 'Street is required!', backgroundColor: AppColor.red);
      return;
    }
    if (zipCodeController.text.isEmpty) {
      toast(context, title: 'Zipcode is required!', backgroundColor: AppColor.red);
      return;
    }

    if (websiteController.text.isEmpty) {
      toast(context, title: 'Website is required!', backgroundColor: AppColor.red);
      return;
    }
    if (companyNameController.text.isEmpty) {
      toast(context, title: 'Company Name is required!', backgroundColor: AppColor.red);
      return;
    }
  }

  bool isEdit = false;
  void setAdd() {
    isEdit = false;
    notifyListeners();
  }

  /* UPDATE */
  void setProfileUpdate(UserModel user) {
    isEdit = true;
    nameController = TextEditingController(text: user.name);
    userNameController = TextEditingController(text: user.username);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    suiteController = TextEditingController(text: user.address?.suite ?? '');
    cityController = TextEditingController(text: user.address?.city ?? '');
    streetController = TextEditingController(text: user.address?.street ?? '');
    zipCodeController = TextEditingController(text: user.address?.zipcode ?? '');
    websiteController = TextEditingController(text: user.website);
    companyNameController = TextEditingController(text: user.company?.name ?? '');
  }
}
