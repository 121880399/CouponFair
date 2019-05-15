
import 'package:connectivity/connectivity.dart';
import 'dart:collection';
import 'dart:io';
import 'package:coupon_fair/common/config.dart';
import 'package:dio/dio.dart';
import 'package:coupon_fair/net/code.dart';
import 'package:coupon_fair/net/result_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HttpRequest{
  static String _baseUrl;

  static const CONTENT_TYPE_JSON = "application/json";

  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static Map optionParams ={
    "timeoutMs" : 15000,
    "token" : null,
  };


  static set baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  static get(url,param) async{
    return await request(_baseUrl+url,param,null,new Options(method:"GET"));
  }
  
  static post(url,param)async{
    return await request(_baseUrl+url, param, {"Accept": CONTENT_TYPE_JSON},
        new Options(method: 'POST'));
  }

  static delete(url,param)async{
    return await request(_baseUrl+url, param, null, new Options(method: 'DELE'
        'TE'));
  }

  static put(url,param) async{
    return await request(_baseUrl+url, param, null, new Options(method: "PUT", contentType: ContentType.text));
  }


  static request(url,params,Map<String,String> header,Options option,{noTip =
      false}) async{

    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR,"",
          noTip),false,Code.NETWORK_ERROR);
    }

    //添加头信息
    Map<String,String> headers = new HashMap();
    if(headers != null){
      headers.addAll(header);
    }

    if(option != null){
      option.headers = headers;
    }else{
      option = new Options(method:"get");
      option.headers = headers;
    }

    option.connectTimeout = 15000;

    Dio dio = new Dio();

    //添加拦截器
    if(Config.DEBUG){
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options){
          print("\n================== 请求数据 ==========================");
          print("url = ${options.uri.toString()}");
          print("headers = ${options.headers}");
          print("params = ${options.data}");
        },
        onResponse: (Response response){
          print("\n================== 响应数据 ==========================");
          print("code = ${response.statusCode}");
          print("data = ${response.data}");
          print("\n");
        },
        onError: (DioError e){
          print("\n================== 错误响应数据 ======================");
          print("type = ${e.type}");
          print("message = ${e.message}");
          print("stackTrace = ${e.stackTrace}");
          print("\n");
        }
      ));
    }

    Response response;

    try{
      response = await dio.request(url,data: params,options: option);
    }on DioError catch(e){
      //请求错误处理
      Response errorResponse;
      if(e.response != null){
        errorResponse = e.response;
      }else{
        errorResponse = new Response(statusCode: 666);
      }

      if(e.type == DioErrorType.CONNECT_TIMEOUT){
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }

      if(Config.DEBUG){
        print('请求异常: ' + e.toString());
        print('请求异常 url: ' + url);
      }
      return new ResultData(Code.errorHandleFunction(errorResponse
          .statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    try{
      if(option.contentType != null && option.contentType.primaryType == "tex"
          "t"){
        return new ResultData(response.data, true, Code.SUCCESS);
      }else{
        var responseJson = response.data;
        if(response.statusCode == 201 && responseJson["token"] != null){
         //存储在SP
        }
      }
      if(response.statusCode == 200 || response.statusCode ==201){
        return ResultData(response.data, true, Code.SUCCESS,headers: response
            .headers);
      }
    }catch(e){
      print(e.toString() + url);
      return ResultData(response.data, false, response.statusCode, headers:
      response.headers);
    }
    return new ResultData(Code.errorHandleFunction(response.statusCode, "",
        noTip),false, response.statusCode);
  }

  ///获取授权token
  static getAuthorization() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(Config.TOKEN_KEY);
    if (token == null) {
    } else {
      optionParams["token"] = token;
      return token;
    }
  }


}