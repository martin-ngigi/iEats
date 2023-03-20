class ResponseModel{
  bool _isSuccess; /// "_" is a private modifier
  String _message;

  ResponseModel(
     this._isSuccess,
     this._message,
  );

  /// get is public
  String get message => _message;
  bool get isSuccess => _isSuccess;

}