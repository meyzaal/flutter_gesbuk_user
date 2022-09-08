class Event {
  Event({
    this.id,
    this.name,
    this.imageUrl,
    this.location,
    this.startDate,
    this.endDate,
    this.key,
    this.isEnrolled,
    this.guestList,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? imageUrl;
  String? location;
  DateTime? startDate;
  DateTime? endDate;
  String? key;
  bool? isEnrolled;
  List<String>? guestList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
}
