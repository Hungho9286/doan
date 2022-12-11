import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static final uidKey = "hahahahaha";
  static final lkey = "lalalalala";
  static final rkey = "hohohohoho";
  static final nkey = "hihihihihi";
  static final mkey = "hehehehehe";
  static final pkey = "iuiuiuiuiu";
  static final Audkey = "audkey123";
  static final Chankey = "chankey123";
  static final Fiftykey = "fiftykey123";
  static final ExpKey = "expkey123";


  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }

  static Future<bool> saveChaoPoint(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mkey, money);
  }

  static Future<String?> getChaoPoint() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mkey);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, name);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }
  static Future<bool> saveAddress(String address) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, address);
  }

  static Future<String?> getAddress() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }
  static Future<bool> savePhone(String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, phone);
  }

  static Future<String?> getPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }

  static Future<bool> saveAv(String photoURL) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pkey, photoURL);
  }

  static Future<String?> getAva() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pkey);
  }
  
  static Future<bool> saveStatus(bool status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(pkey, status);
  }

  static Future<bool?> getStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(pkey);
    
  }
 



  

}