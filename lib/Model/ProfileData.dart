class ProfileData {
  String name, bio, userName, publicRepo, publicGist, avatar, privateRepo;

  ProfileData(
      {this.name,
      this.bio,
      this.userName,
      this.publicRepo,
      this.publicGist,
      this.avatar,
      this.privateRepo});

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
      name: json["name"] == null ? "" : json["name"],
      bio: json["bio"] == null ? "" : json["bio"],
      avatar: json["avatar_url"],
      userName: json["login"],
      publicGist: json["public_gists"].toString(),
      publicRepo: json["public_repos"].toString(),
      privateRepo: json["plan"] == null
          ? "N/A"
          : json["plan"]["private_repos"].toString());
}
