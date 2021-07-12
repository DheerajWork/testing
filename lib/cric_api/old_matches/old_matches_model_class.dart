class OldMatchesDataModel {
  String ?uniqueId;
  String ?description;
  String ?title;

  OldMatchesDataModel({this.uniqueId, this.description, this.title});

  OldMatchesDataModel.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_id'] = this.uniqueId;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}