class AddressModel{
  late int? _id; //? means its optional
  late String _addressType;
  late String? _contactPersonName; // ? means its optional
  late String? _contactPersonNumber; // ? means its optional
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    contactPersonNumber,
    address,
    latitude,
    longitude
  }){
   _id = id;
   _addressType =addressType;
   _contactPersonName = contactPersonName;
   _contactPersonNumber = contactPersonNumber;
   _address = address;
   _latitude = latitude;
   _longitude = longitude;
  }

  //gettters
  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonNumber => _contactPersonNumber;
  String? get contactPersonName => _contactPersonName;
  String get latitude => _latitude;
  String get longitude => _longitude;

   // convert from json to object
  AddressModel.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _addressType = json['address_type']??""; // if empty, use ""
    _contactPersonNumber = json['contact_person_number']??""; // if empty, use ""
    _contactPersonName = json['contact_person_name']??""; // if empty, use ""
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  //convert from object to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this._id;
    data['address_type'] = this._addressType;
    data['contact_person_number'] = this._contactPersonNumber;
    data['contact_person_name'] = this._contactPersonName;
    data['address'] = this._address;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }

}