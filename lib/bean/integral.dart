


///  积分明细数据 @author zhangjun  @date 2019-4-3
class IntegralInfo {
    String title;
    String balance;
    String integralMallUrl;
    String integralDescription;
    String integralClearText;
    List<IntegralInfoDetail> details;

    IntegralInfo(
    {this.title,
            this.balance,
            this.integralMallUrl,
            this.integralDescription,
            this.integralClearText,
            this.details});

  IntegralInfo.fromJson(Map<String, dynamic> json) {
        title = json['title'];
        balance = json['balance'];
        integralMallUrl = json['integralMallUrl'];
        integralDescription = json['integralDescription'];
        integralClearText = json['integralClearText'];
        if (json['details'] != null) {
            details = new List<IntegralInfoDetail>();
            json['details'].forEach((v) {
                    details.add(new IntegralInfoDetail.fromJson(v));
      });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['title'] = this.title;
        data['balance'] = this.balance;
        data['integralMallUrl'] = this.integralMallUrl;
        data['integralDescription'] = this.integralDescription;
        data['integralClearText'] = this.integralClearText;
        if (this.details != null) {
            data['details'] = this.details.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class IntegralInfoDetail {
    String explain;
    String operationTime;
    String integralNumber;

    IntegralInfoDetail({this.explain, this.operationTime, this.integralNumber});

    IntegralInfoDetail.fromJson(Map<String, dynamic> json) {
        explain = json['explain'];
        operationTime = json['operationTime'];
        integralNumber = json['integralNumber'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['explain'] = this.explain;
        data['operationTime'] = this.operationTime;
        data['integralNumber'] = this.integralNumber;
        return data;
    }
}
