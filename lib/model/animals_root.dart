class AnimalsRoot {
  Animals animals;

  AnimalsRoot({this.animals});

  AnimalsRoot.fromJson(Map<String, dynamic> json) {
    animals =
    json['animals'] != null ? new Animals.fromJson(json['animals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animals != null) {
      data['animals'] = this.animals.toJson();
    }
    return data;
  }
}

class Animals {
  List<Dog> dog;
  Cat cat;

  Animals({this.dog, this.cat});

  Animals.fromJson(Map<String, dynamic> json) {
    if (json['dog'] != null) {
      dog = new List<Dog>();
      json['dog'].forEach((v) {
        dog.add(new Dog.fromJson(v));
      });
    }
    cat = json['cat'] != null ? new Cat.fromJson(json['cat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dog != null) {
      data['dog'] = this.dog.map((v) => v.toJson()).toList();
    }
    if (this.cat != null) {
      data['cat'] = this.cat.toJson();
    }
    return data;
  }
}

class Dog {
  String name;
  String breed;
  int count;
  bool twoFeet;

  Dog({this.name, this.breed, this.count, this.twoFeet});

  Dog.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    breed = json['breed'];
    count = json['count'];
    twoFeet = json['twoFeet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['breed'] = this.breed;
    data['count'] = this.count;
    data['twoFeet'] = this.twoFeet;
    return data;
  }
}

class Cat {
  String name;

  Cat({this.name});

  Cat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
