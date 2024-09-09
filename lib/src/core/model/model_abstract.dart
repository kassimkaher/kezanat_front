mixin ModelParser<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<dynamic, dynamic> json);
}
