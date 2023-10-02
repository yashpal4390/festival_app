// ignore_for_file: camel_case_types, non_constant_identifier_names

class desc {
  String? Wish;
  desc(this.Wish);

  factory desc.fromMap(Map map) {
    return desc(map["Wish"]);
  }
}
