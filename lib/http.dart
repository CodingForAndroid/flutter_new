import 'package:dio/dio.dart';
import 'dart:async';
import 'bean/result_data.dart';
var dio=new Dio();

class NetUtil{

  ///get 请求
   static get(String url,{Map<String,dynamic> params}) async{
     //第一种写法
//     await dio.get(url,queryParameters: params).then((response){
//       if(response.statusCode == 200 ){
//         //request success
//         print(response.data);
//         return  response.data;
//       }else{
//         throw Exception('load Failed');
//       }
//     });
   //第二种写法

//     var response =  await dio.request(url,queryParameters: params);

     var response =  await dio.get(url,queryParameters: params);
    if(response.statusCode == 200 ){
      //request success
//      print(response.data);
      return  response.data;
    }else{
      throw Exception('load Failed');
    }
  }


//  static getRequest(String url,{Map<String,dynamic> params}) async{
//    var response =  await dio.get(url,queryParameters: params);
//    if(response.statusCode == 200 ){
//      //request success
////      print(response.data);
//      return  ResultData(response.data);response.data;
//    }else{
//      throw Exception('load Failed');
//    }
//  }
}