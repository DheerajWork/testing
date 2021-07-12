class CricketScoreModelClass {
  bool   ?matchStarted;
  String ?team1;
  String ?team2;
  String ?v;
  int    ? ttl;
  int ?creditsLeft;

  CricketScoreModelClass(
      {this.matchStarted,
        this.team1,
        this.team2,
        this.v,
        this.ttl,
        this.creditsLeft});

  CricketScoreModelClass.fromJson(Map<String, dynamic> json) {
    matchStarted = json['matchStarted'];
    team1 = json['team-1'];
    team2 = json['team-2'];
    v = json['v'];
    ttl = json['ttl'];

    creditsLeft = json['creditsLeft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matchStarted'] = this.matchStarted;
    data['team-1'] = this.team1;
    data['team-2'] = this.team2;
    data['v'] = this.v;
    data['ttl'] = this.ttl;
    data['creditsLeft'] = this.creditsLeft;
    return data;
  }
}