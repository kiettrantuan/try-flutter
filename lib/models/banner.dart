class BannerItem {
  final String id;
  final int width;
  final int height;
  final String imageUrl;

  BannerItem(
      {required this.id,
      required this.width,
      required this.height,
      required this.imageUrl});

  // Factory method to create a BannerItem from JSON
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      imageUrl: json['download_url'],
    );
  }
}

// {
// "id": "0",
// "author": "Alejandro Escamilla",
// "width": 5616,
// "height": 3744,
// "url": "https://unsplash.com/...",
// "download_url": "https://picsum.photos/..."
// }
