class SingleCommitData {
  String title, avatar, name, time;
  SingleCommitData({this.title, this.avatar, this.name, this.time});
  factory SingleCommitData.fromJson(dynamic json) {
    return SingleCommitData(
        title: json['commit']['message'],
        avatar: json['author']['avatar_url'],
        name: json['author']['login'],
        time: json['commit']['author']['date']);
  }
}
