class desc {
  String? Wish;
  desc(this.Wish);

  factory desc.fromMap(Map map) {
    return desc(map["Wish"]);
  }
}
