class NewsResponse {
  NewsResponse({
      this.count, 
      this.news,});

  NewsResponse.fromJson(dynamic json) {
    count = json['count'];
    if (json['news'] != null) {
      news = [];
      json['news'].forEach((v) {
        news?.add(News.fromJson(v));
      });
    }
  }
  String? count;
  List<News>? news;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (news != null) {
      map['news'] = news?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class News {
  News({
      this.id, 
      this.title, 
      this.slug, 
      this.previewImage, 
      this.fullText, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.formatedDate, 
      this.lang,});

  News.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    previewImage = json['preview_image'];
    fullText = json['full_text'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    formatedDate = json['formated_date'];
    lang = json['lang'];
  }
  String? id;
  String? title;
  String? slug;
  String? previewImage;
  String? fullText;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? formatedDate;
  String? lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['preview_image'] = previewImage;
    map['full_text'] = fullText;
    map['active'] = active;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['formated_date'] = formatedDate;
    map['lang'] = lang;
    return map;
  }

}