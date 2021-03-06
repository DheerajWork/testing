class MatchCalendarModelClass {
  String?uniqueId;
  String?name;
  String?date;

  MatchCalendarModelClass({this.uniqueId, this.name, this.date});

  MatchCalendarModelClass.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'];
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_id'] = this.uniqueId;
    data['name'] = this.name;
    data['date'] = this.date;
    return data;
  }
}