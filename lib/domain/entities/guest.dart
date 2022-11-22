class Guest {
  Guest(
      {this.id,
      this.name,
      this.address,
      this.category,
      this.eventId,
      this.picture,
      this.v,
      this.createdAt,
      this.updatedAt,
      this.checkInTime,
      this.isExpanded,
      this.isPictureUploaded});

  String? id;
  String? name;
  String? address;
  String? category;
  String? eventId;
  String? picture;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? checkInTime;
  bool? isExpanded;
  bool? isPictureUploaded;
}
