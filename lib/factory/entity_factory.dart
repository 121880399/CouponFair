
import 'package:coupon_fair/model/commission_list_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CommissionListEntity") {
      return CommissionListEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}