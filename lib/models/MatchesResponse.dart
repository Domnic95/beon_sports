// To parse this JSON data, do
//
//     final matchesResponseModel = matchesResponseModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MatchesResponseModel> matchesResponseModelFromJson(String str) =>
    List<MatchesResponseModel>.from(
        json.decode(str).map((x) => MatchesResponseModel.fromJson(x)));

String matchesResponseModelToJson(List<MatchesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchesResponseModel {
  MatchesResponseModel({
    this.commenceTime,
    this.lastUpdate,
    this.homeTeam,
    this.awayTeam,
    this.completed,
    this.homeTeamLogo,
    this.awayTeamLogo,
    this.homeTeamScore,
    this.awayTeamScore,
  });

  DateTime? commenceTime;
  DateTime? lastUpdate;
  String? homeTeam;
  String? awayTeam;
  String? completed;
  String? homeTeamLogo;
  String? awayTeamLogo;
  String? homeTeamScore;
  String? awayTeamScore;

  factory MatchesResponseModel.fromJson(Map<String, dynamic> json) =>
      MatchesResponseModel(
        commenceTime: json["commence_time"] == null
            ? null
            : DateTime.parse(json["commence_time"]),
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
        homeTeam: json["home_team"],
        awayTeam: json["away_team"],
        completed: json["completed"],
        homeTeamLogo: json["home_team_logo"],
        awayTeamLogo: json["away_team_logo"],
        homeTeamScore: json["home_team_score"],
        awayTeamScore: json["away_team_score"],
      );

  Map<String, dynamic> toJson() => {
        "commence_time": commenceTime?.toIso8601String(),
        "last_update": lastUpdate?.toIso8601String(),
        "home_team": homeTeam,
        "away_team": awayTeam,
        "completed": completed,
        "home_team_logo": homeTeamLogo,
        "away_team_logo": awayTeamLogo,
        "home_team_score": homeTeamScore,
        "away_team_score": awayTeamScore,
      };
}

