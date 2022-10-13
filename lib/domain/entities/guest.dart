class Guest {
  Guest({
    this.id,
    this.name,
    this.address,
    this.category,
    this.eventId,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.checkInTime,
    this.isExpanded,
  });

  String? id;
  String? name;
  String? address;
  String? category;
  String? eventId;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? checkInTime;
  bool? isExpanded;
}
