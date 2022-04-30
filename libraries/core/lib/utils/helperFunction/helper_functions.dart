import 'dart:io';
var successCode = [201, 200, 204, 203, 202];
bool isNullOrEmpty(String text) {
  if (text == null || text.isEmpty)
    return true;
  else
    return false;
}
bool isSuccessState(int code) {
  return successCode.contains(code);
}