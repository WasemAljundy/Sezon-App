class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? bio;
  String? jobTitle;
  double? latitude;
  double? longitude;
  String? country;
  String? image;
  int? active;
  String? emailVerifiedAt;
  int? imagesCount;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.bio,
        this.jobTitle,
        this.latitude,
        this.longitude,
        this.country,
        this.image,
        this.active,
        this.emailVerifiedAt,
        this.imagesCount});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    bio = json['bio'];
    jobTitle = json['job_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    image = json['image'];
    active = json['active'];
    emailVerifiedAt = json['email_verified_at'];
    imagesCount = json['images_count'];
  }

}