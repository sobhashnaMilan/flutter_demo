class HomeModel {
  HomeModel({
    this.count,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  int? count;
  int? recordsTotal;
  int? recordsFiltered;
  List<Datum>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        count: json["count"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.totalReviews,
    this.averageRate,
    this.eventDetails,
    this.isCheckin,
    this.isPlaceCheckin,
    this.isPlaceCheckout,
    this.isOntheway,
    this.isPlanningon,
    this.allowInvite,
    this.isCheckout,
    this.id,
    this.name,
    this.googlePlaceId,
    this.address,
    this.image,
    this.location,
    this.isPremium,
    this.placeCheckinLog,
  });

  int? totalReviews;
  int? averageRate;
  EventDetails? eventDetails;
  bool? isCheckin;
  bool? isPlaceCheckin;
  bool? isPlaceCheckout;
  bool? isOntheway;
  bool? isPlanningon;
  bool? allowInvite;
  bool? isCheckout;
  String? id;
  String? name;
  String? googlePlaceId;
  String? address;
  String? image;
  Location? location;
  bool? isPremium;
  List<dynamic>? placeCheckinLog;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalReviews: json["totalReviews"],
        averageRate: json["averageRate"],
        eventDetails: EventDetails.fromJson(json["eventDetails"]),
        isCheckin: json["isCheckin"],
        isPlaceCheckin: json["isPlaceCheckin"],
        isPlaceCheckout: json["isPlaceCheckout"],
        isOntheway: json["isOntheway"],
        isPlanningon: json["isPlanningon"],
        allowInvite: json["allowInvite"],
        isCheckout: json["isCheckout"],
        id: json["_id"],
        name: json["name"],
        googlePlaceId: json["googlePlaceId"],
        address: json["address"],
        image: json["image"] ?? "",
        location: Location.fromJson(json["location"]),
        isPremium: json["isPremium"],
        placeCheckinLog: json["placeCheckinLog"] != null
            ? List<dynamic>.from(
                json["placeCheckinLog"].map((x) => x),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "totalReviews": totalReviews,
        "averageRate": averageRate,
        "eventDetails": eventDetails!.toJson(),
        "isCheckin": isCheckin,
        "isPlaceCheckin": isPlaceCheckin,
        "isPlaceCheckout": isPlaceCheckout,
        "isOntheway": isOntheway,
        "isPlanningon": isPlanningon,
        "allowInvite": allowInvite,
        "isCheckout": isCheckout,
        "_id": id,
        "name": name,
        "googlePlaceId": googlePlaceId,
        "address": address,
        "image": image,
        "location": location!.toJson(),
        "isPremium": isPremium,
        "placeCheckinLog": List<dynamic>.from(placeCheckinLog!.map((x) => x)),
      };
}

class EventDetails {
  EventDetails({
    this.friendsCheckinCount,
    this.totalCheckin,
    this.day,
  });

  int? friendsCheckinCount;
  int? totalCheckin;
  int? day;

  factory EventDetails.fromJson(Map<String, dynamic> json) => EventDetails(
        friendsCheckinCount: json["friendsCheckinCount"],
        totalCheckin: json["totalCheckin"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "friendsCheckinCount": friendsCheckinCount,
        "totalCheckin": totalCheckin,
        "day": day,
      };
}

class Location {
  Location({
    this.type,
    this.index,
    this.coordinates,
  });

  String? type;
  String? index;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        index: json["index"],
        coordinates: List<double>.from(
          json["coordinates"].map((x) => x.toDouble()),
        ),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "index": index,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
