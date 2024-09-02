class PackageModel{
  final String title;
  final String price;
  final String desc;


  PackageModel({
    required this.title,
    required this.price,
    required this.desc,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      title: json['title'] ?? 'N/A',
      price: json['price'] ?? 'N/A',
      desc: json['desc'] ?? 'N/A',
    );
  }
}