class ResponseModel{
  late bool _isSuccess; /// "_" is a private modifier
  late String _message;

  ResponseModel(
     this._isSuccess,
     this._message,
  );

  /// get is public
  String get message => _message;
  bool get isSuccess => _isSuccess;

  /// convert from json to object
  ResponseModel.fromJson(Map json){
    _isSuccess = json["success"];
    _message = json["message"];
  }

}