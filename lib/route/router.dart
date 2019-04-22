import 'package:annotation_route/route.dart';
import './router.internal.dart';

@ARouteRoot()
class Router {
  ARouterInternal internal = ARouterInternalImpl();
  dynamic getPage(MyRouteOption option) {
   print(option.urlpattern) ;
    return internal.findPage(
        ARouteOption(option.urlpattern, option.params), option);
  }
}

class MyRouteOption {//extends ARouteOption : super(urlpattern, params);
  String urlpattern;
  Map<String, dynamic> params;
  MyRouteOption({this.urlpattern,this.params });
//  MyRouteOption(String urlpattern, Map<String,dynamic > params) ;
//
//  MyRouteOption(String urlpattern, Map<String,dynamic > params) : super(urlpattern, params);
}
