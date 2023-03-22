class Data {
  Data({
      this.token, 
      this.name, 
      this.email, 
      this.hasMedia, 
      this.media,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    hasMedia = json['has_media'];
    media = json['media'];
  }
  String? token;
  String? name;
  String ?email;
  bool ?hasMedia;
  String? media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['email'] = email;
    map['has_media'] = hasMedia;
    map['media'] = media;
    return map;
  }

}