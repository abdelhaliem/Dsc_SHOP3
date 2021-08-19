import 'package:dsc_shop/main.dart';
import 'package:flutter/cupertino.dart';

class Language extends ChangeNotifier {
  String _lang = language;
  getLanguage() {
    return _lang;
  }

  setLanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  String tLanguage() {
    if (getLanguage() == 'AR') {
      return 'اللغه';
    } else {
      return "Language";
    }
  }

  String tLogOut() {
    if (getLanguage() == 'AR') {
      return 'تسجيل خروج';
    } else if (getLanguage() == 'EN') {
      return "LogOut";
    }
  }

  String tDarkMode() {
    if (getLanguage() == 'AR') {
      return 'الوضع المظلم';
    } else if (getLanguage() == 'EN') {
      return "DarkMode";
    }
  }

  String tAbout() {
    if (getLanguage() == 'AR') {
      return 'حول';
    } else if (getLanguage() == 'EN') {
      return "About";
    }
  }

  String tCategory() {
    if (getLanguage() == 'AR') {
      return 'الاقسام :';
    } else if (getLanguage() == 'EN') {
      return "Category :";
    }
  }

  String tDescription() {
    if (getLanguage() == 'AR') {
      return 'الوصف :';
    } else if (getLanguage() == 'EN') {
      return "Description :";
    }
  }

  String tWelcomeBack() {
    if (getLanguage() == 'AR') {
      return 'مرحباً بعودتك';
    } else if (getLanguage() == 'EN') {
      return "Welcome Back";
    }
  }

  String tnotAcount() {
    if (getLanguage() == 'AR') {
      return 'هل ليس لديك حساب ';
    } else if (getLanguage() == 'EN') {
      return "Do not have am account";
    }
  }

  String tCrateAcount() {
    if (getLanguage() == 'AR') {
      return 'انشاء حساب ';
    } else if (getLanguage() == 'EN') {
      return "Sign Up";
    }
  }

  String tAccount() {
    if (getLanguage() == 'AR') {
      return 'انشاء حساب ';
    } else if (getLanguage() == 'EN') {
      return "Create Account";
    }
  }

  String tSetting() {
    if (getLanguage() == 'AR') {
      return 'الاعدادات';
    } else if (getLanguage() == 'EN') {
      return "Setting";
    }
  }
}
