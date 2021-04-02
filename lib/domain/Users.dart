class User {
  String username;
  String firstName;
  String lastName;
  String token;
  String imageUrl = "";
  String bannerUrl = "";
  User.instance(
    this.username,
    this.firstName,
    this.lastName,
    this.token,
    this.imageUrl,
    this.bannerUrl,
  );
}
