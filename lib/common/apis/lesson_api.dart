import 'package:ulearn_teacher/common/entities/lesson.dart';
import 'package:ulearn_teacher/common/utils/http_util.dart';

class LessonAPI {
  static Future<LessonListResponseEntity> lessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/lessonList', queryParameters: params?.toJson());
    print(response.toString());
    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/lessonDetail', queryParameters: params?.toJson());
    print(response.toString());
    return LessonDetailResponseEntity.fromJson(response);
  }
}
