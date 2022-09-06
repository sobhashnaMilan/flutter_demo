import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeBoxExtension on int {
  Widget get sizeBoxW => SizedBox(width: w);

  Widget get sizeBoxH => SizedBox(height: h);
}
