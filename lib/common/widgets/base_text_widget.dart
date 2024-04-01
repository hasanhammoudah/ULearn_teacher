import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_teacher/common/values/colors.dart';

// AppBar buildAppBar(String url) {
//   return AppBar(
//     title: reusableText(url),
//   );
// }

Widget reusableText2(
  String text, {
  Color color = AppColors.primaryText,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}

Widget listContainer(String name,
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    width: 180.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      name,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget searchView(BuildContext context, String hintText, {bool home = true}) {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(
            15.h,
          ),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 17.w,
              ),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                textInputAction: TextInputAction.search,
                onChanged: (value) {},
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    if (home == false) {
                      // MySearchController(context: context)
                      //     .asyncLoadSearchData(value);
                    }
                  }
                },
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(
                13.w,
              ),
            ),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: Image.asset(
            'assets/icons/options.png',
          ),
        ),
      ),
    ],
  );
}

Widget appPrimaryButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(
        10.w,
      ),
      border: Border.all(
        color: AppColors.primaryElement,
      ),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
