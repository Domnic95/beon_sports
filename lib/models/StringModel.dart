class stringClass {
  String title;
  String apiend;
  String assets;
  stringClass(
      {required this.title, required this.apiend, required this.assets});
}

List<stringClass> stringList = [
  stringClass(
      title: 'Baseball',
      apiend: 'baseball_mlb',
      assets: "assets/svg/baseball.svg"),
  stringClass(
      title: 'Soccer',
      apiend: 'soccer_usa_mls',
      assets: "assets/svg/soccer.svg"),
  stringClass(
      title: 'Basketball',
      apiend: 'basketball_nba',
      assets: "assets/svg/basketball.svg"),
  stringClass(
      title: 'American Football',
      apiend: 'americanfootball_ncaaf',
      assets: "assets/svg/american_football.svg"),
];
