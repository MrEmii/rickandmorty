// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RequestInfo {
  int count;
  int pages;
  String? next;
  String? prev;

  RequestInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory RequestInfo.fromMap(Map<String, dynamic> map) {
    return RequestInfo(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestInfo.fromJson(String source) => RequestInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
