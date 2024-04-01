
import 'package:ulearn_teacher/common/entities/user.dart';
import 'package:ulearn_teacher/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response =
        await HttpUtil().post('api/login', queryParameters: params?.toJson());
    return UserLoginResponseEntity.fromJson(response);
  }
  
}
