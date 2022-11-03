
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper
{
  static SharedPreferences? sharedPreferences;
  static init()async
  {
    sharedPreferences =await SharedPreferences.getInstance();
  }


  static dynamic getData({
    required String key
  })
  {
    print(key);
    print('from get');
    return sharedPreferences!.get(key);
  }

  static Future<dynamic> saveData({
  required String key ,
    required dynamic value
})async
  {
    if(value is String)
      {
        return await sharedPreferences!.setString(key, value);
      }
    if(value is bool)
    {
      return await sharedPreferences!.setBool(key, value);
    }
    if(value is double)
    {
      return await sharedPreferences!.setDouble(key, value);
    }


    return await sharedPreferences!.setInt(key, value);


  }
}