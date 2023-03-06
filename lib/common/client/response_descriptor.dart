import 'package:flutter_mobile_starter/common/data/models/user_models.dart';

class ResponseDescriptor {
  static final _responseDescriptor = <Type, Function>{
    FullUserModel: (Map<String, dynamic> data) => FullUserModel.fromJson(data),
  };

  static CUSTOMMODEL parseMap<CUSTOMMODEL>(Map<String, dynamic> data) {
    return _responseDescriptor[CUSTOMMODEL]!(data);
  }
}
