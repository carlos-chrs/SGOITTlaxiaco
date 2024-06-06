import 'package:web_app_tec/models/usuario_global.dart';

class UserGeneral {
  List<UserGlobal>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
  int? nextPage;

  UserGeneral(
      {this.docs,
      this.totalDocs,
      this.limit,
      this.totalPages,
      this.page,
      this.pagingCounter,
      this.hasPrevPage,
      this.hasNextPage,
      this.prevPage,
      this.nextPage});

  UserGeneral.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <UserGlobal>[];
      json['docs'].forEach((v) {
        docs!.add(UserGlobal.fromJson(v));
      });
    }
    totalDocs = json['totalDocs'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    page = json['page'];
    pagingCounter = json['pagingCounter'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prevPage = json['prevPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    data['totalDocs'] = totalDocs;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['page'] = page;
    data['pagingCounter'] = pagingCounter;
    data['hasPrevPage'] = hasPrevPage;
    data['hasNextPage'] = hasNextPage;
    data['prevPage'] = prevPage;
    data['nextPage'] = nextPage;
    return data;
  }
}
