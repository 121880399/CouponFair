class CommissionListEntity {
	String msg;
	int code;
	CommissionListData data;
	int time;

	CommissionListEntity({this.msg, this.code, this.data, this.time});

	CommissionListEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new CommissionListData.fromJson(json['data']) : null;
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['time'] = this.time;
		return data;
	}
}

class CommissionListData {
	String originalPrice;
	String discounts;
	bool isSelfSupport;
	String goodsId;
	String imageUrl;
	String commission;
	String surplusNum;
	String goodsName;

	CommissionListData({this.originalPrice, this.discounts, this.isSelfSupport, this.goodsId, this.imageUrl, this.commission, this.surplusNum, this.goodsName});

	CommissionListData.fromJson(Map<String, dynamic> json) {
		originalPrice = json['originalPrice'];
		discounts = json['discounts'];
		isSelfSupport = json['isSelfSupport'];
		goodsId = json['goodsId'];
		imageUrl = json['imageUrl'];
		commission = json['commission'];
		surplusNum = json['surplusNum'];
		goodsName = json['goodsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['originalPrice'] = this.originalPrice;
		data['discounts'] = this.discounts;
		data['isSelfSupport'] = this.isSelfSupport;
		data['goodsId'] = this.goodsId;
		data['imageUrl'] = this.imageUrl;
		data['commission'] = this.commission;
		data['surplusNum'] = this.surplusNum;
		data['goodsName'] = this.goodsName;
		return data;
	}
}
