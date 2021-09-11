import 'package:mobile_shop_app/@core/data/repo/services/user_srv.dart';

class UserRepo {
  Future register(String deviceId, String name) async {
    final res = await UserSrv().mutate(
        'registerUser',
        '''
        deviceId: "$deviceId"
        name: "$name"
        ''',
        fragment: userFragment);
    return res['registerUser'];
  }

  String userFragment = """
   user{
    id
    name
    avatar
  }
  token
  """;
}
