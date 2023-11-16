class HttpBaseResponse {
  int code;
  dynamic data;
  String message;
  dynamic detail;

  HttpBaseResponse({
    required this.code,
    required this.data,
    required this.message,
    required this.detail,
  });

  factory HttpBaseResponse.fromJson(Map<String, dynamic> json) =>
      HttpBaseResponse(
        code: json['code'] as int,
        data: json['data'],
        message: json['message'].toString(),
        detail: json['detail'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data.toJson(),
        'message': message,
        'detail': detail,
      };
}
