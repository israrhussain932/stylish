class AllFeatureModel {
  final String id;
  final String imgURL;
  final String title;

  AllFeatureModel({
    required this.id,
    required this.imgURL,
    required this.title,
  });

  factory AllFeatureModel.fromMap(Map<String, dynamic> map, String docId) {
    return AllFeatureModel(
      id: docId,
      imgURL: map['imgURL'] ?? '',
      title: map['title'] ?? '',
    );
  }
}
