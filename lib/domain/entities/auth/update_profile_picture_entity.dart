class UpdateProfilePictureEntity {
  final String image;
  UpdateProfilePictureEntity({required this.image});
  Map<String, dynamic> toJson() {
    return {
      "File": image,
    };
  }
}
