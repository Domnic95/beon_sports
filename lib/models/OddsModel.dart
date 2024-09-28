// To parse this JSON data, do
//
//     final scroreModel = scroreModelFromJson(jsonString);

import 'dart:convert';

List<ScroreModel> scroreModelFromJson(String str) => List<ScroreModel>.from(
    json.decode(str).map((x) => ScroreModel.fromJson(x)));

String scroreModelToJson(List<ScroreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScroreModel {
  String? id;
  String? sportKey;
  String? sportTitle;
  DateTime? commenceTime;
  String? homeTeam;
  String? awayTeam;
  List<Bookmaker>? bookmakers;

  ScroreModel({
    this.id,
    this.sportKey,
    this.sportTitle,
    this.commenceTime,
    this.homeTeam,
    this.awayTeam,
    this.bookmakers,
  });

  factory ScroreModel.fromJson(Map<String, dynamic> json) => ScroreModel(
        id: json["id"],
        sportKey: json["sport_key"],
        sportTitle: json["sport_title"],
        commenceTime: json["commence_time"] == null
            ? null
            : DateTime.parse(json["commence_time"]),
        homeTeam: json["home_team"],
        awayTeam: json["away_team"],
        bookmakers: json["bookmakers"] == null
            ? []
            : List<Bookmaker>.from(
                json["bookmakers"]!.map((x) => Bookmaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_key": sportKey,
        "sport_title": sportTitle,
        "commence_time": commenceTime?.toIso8601String(),
        "home_team": homeTeam,
        "away_team": awayTeam,
        "bookmakers": bookmakers == null
            ? []
            : List<dynamic>.from(bookmakers!.map((x) => x.toJson())),
      };
}

class Bookmaker {
  String? key;
  String? title;
  DateTime? lastUpdate;
  List<Market>? markets;

  Bookmaker({
    this.key,
    this.title,
    this.lastUpdate,
    this.markets,
  });

  factory Bookmaker.fromJson(Map<String, dynamic> json) => Bookmaker(
        key: json["key"],
        title: json["title"],
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
        markets: json["markets"] == null
            ? []
            : List<Market>.from(
                json["markets"]!.map((x) => Market.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "last_update": lastUpdate?.toIso8601String(),
        "markets": markets == null
            ? []
            : List<dynamic>.from(markets!.map((x) => x.toJson())),
      };
}

class Market {
  String? key;
  DateTime? lastUpdate;
  List<Outcome>? outcomes;

  Market({
    this.key,
    this.lastUpdate,
    this.outcomes,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        key: json["key"],
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
        outcomes: json["outcomes"] == null
            ? []
            : List<Outcome>.from(
                json["outcomes"]!.map((x) => Outcome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "last_update": lastUpdate?.toIso8601String(),
        "outcomes": outcomes == null
            ? []
            : List<dynamic>.from(outcomes!.map((x) => x.toJson())),
      };
}

class Outcome {
  String? name;
  double? price;
  double? point;

  Outcome({
    this.name,
    this.price,
    this.point,
  });

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
        name: json["name"],
        price: json["price"]?.toDouble(),
        point: json["point"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "point": point,
      };
}
