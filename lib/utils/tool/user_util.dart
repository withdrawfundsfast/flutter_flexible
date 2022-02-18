import '../../models/login.m.dart';
import './sp_util.dart';

const userInfoKey = 'userInfoKey';

class UserUtil {
  /// 获取缓存用户信息
  static Future<LoginMobileData> getUserInfo() async {
    var cacheData = await SpUtil.getMap(userInfoKey, defValue: {});
    print('cacheData>>> $cacheData');
    return LoginMobileData.fromJson(cacheData.cast<String, dynamic>());
  }

  /// 保存用户信息
  static Future saveUserInfo(LoginMobileData data) async {
    data.avatar = data.avatar?.replaceAll(RegExp(r'http://'), 'https://');
    SpUtil.setMapData(userInfoKey, data.toJson());
  }

  /// 清除用户信息缓存
  static Future cleanUserInfo() async {
    SpUtil.remove(userInfoKey);
  }

  /// 获取token
  static Future<String> getToken() async {
    var userInfo = await getUserInfo();
    return userInfo?.authorization ?? '';
  }

  /// 设置token
  static Future setToken(String value) async {
    var userInfo = await getUserInfo();
    userInfo.authorization = value;
    saveUserInfo(userInfo);
  }

  /// 清除token
  static Future cleanToKen() async {
    var userInfo = await getUserInfo();
    userInfo.authorization = '';
    saveUserInfo(userInfo);
  }
}
