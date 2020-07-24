import 'package:flutter/foundation.dart';

class ApiError {

  final int code;
  final String message;

  ApiError({@required this.code, @required this.message});
}