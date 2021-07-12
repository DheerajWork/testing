class NewMatchModelClass {
  int    ? uniqueId;
  String ?date;
  String ?dateTimeGMT;
  String ?team1;
  String ?team2;
  String ?type;
  String ?tossWinnerTeam;
  String ?winnerTeam;
  bool   ?squad;
  bool   ?matchStarted;

  NewMatchModelClass(
      {this. uniqueId,
        this.date,
        this.dateTimeGMT,
        this.team1,
        this.team2,
        this.type,
        this.tossWinnerTeam,
        this.winnerTeam,
        this.squad,
        this.matchStarted});

  NewMatchModelClass.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    team1 = json['team-1'];
    team2 = json['team-2'];
    type = json['type'];
    tossWinnerTeam = json['toss_winner_team'];
    winnerTeam = json['winner_team'];
    squad = json['squad'];
    matchStarted = json['matchStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_id'] = this.uniqueId;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['team-1'] = this.team1;
    data['team-2'] = this.team2;
    data['type'] = this.type;
    data['toss_winner_team'] = this.tossWinnerTeam;
    data['winner_team'] = this.winnerTeam;
    data['squad'] = this.squad;
    data['matchStarted'] = this.matchStarted;
    return data;
  }
}