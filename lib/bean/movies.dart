
///https://flutterchina.club/json/ 序列化
class Movies {
  int count;
  int start;
  int total;
  List<Subject> subjects;
  String title;

  Movies.fromJson(Map<String, dynamic> jsonStr) {
    count = jsonStr['count'];
    start = jsonStr['start'];
    total = jsonStr['total'];
    title = jsonStr['title'];

    subjects = [];
    if (jsonStr['subjects'] != null) {
      (jsonStr['subjects'] as List).forEach((dataItem) {
        subjects.add(new Subject(dataItem));
      });
    }
    // 这样出错
//    if (jsonStr['subjects'] != null) {
//      for (var dataItem in jsonStr['subjects']) {
//        subjects.add(new Subject(dataItem));
//      }
//    }
    print('=============, ${title}');
  }
}

class Subject {
  String title;
  String year;
  ImageUrl images;

  Subject(Map<String, dynamic> jsonStr) {
    title = jsonStr['title'];
    year = jsonStr['year'];
    print('==========images==========,${jsonStr['images'].toString()}');
    //这样是不对的
//    images =  jsonStr['images'];
    images = ImageUrl(jsonStr['images']);

    //type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'ImageUrl'
//    images = jsonStr['images'];
//    if (jsonStr['images'] != null) {
//      (jsonStr['images'] as List).forEach((dataItem) {
//        images.add(new ImageUrl(dataItem));
//      });
//    }
    //Dart Error: Unhandled exception: E/flutter (29670): type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Iterable<dynamic>'
//    if (jsonStr['images'] != null) {
//      for (var dataItem in jsonStr['images']) {
//        images.add(new ImageUrl(dataItem));
//      }
//    }
  }
}

class ImageUrl {
  String small;
  String large;
  String medium;

  ImageUrl(jsonStr) {
    small = jsonStr['small'];
    large = jsonStr['large'];
    medium = jsonStr['medium'];
  }
}
