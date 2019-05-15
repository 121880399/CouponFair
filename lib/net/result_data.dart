///网络结果数据根据跟后台定义的JSON结构进行修改
class ResultData{
  var data;
  bool result;
  int code;
  var headers;

  ResultData(this.data, this.result, this.code,{this.headers});
}