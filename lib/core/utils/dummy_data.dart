class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category({required this.id, required this.title, required this.imageFileName});
}

class AppDatabase {
  static List<Category> get categories {
    return [
      Category(
        id: 101,
        title: 'Technology',
        imageFileName: 'large_post_1.jpg',
      ),
      Category(
        id: 102,
        title: 'Cinema',
        imageFileName: 'large_post_2.jpg',
      ),
      Category(
        id: 103,
        title: 'Transportation',
        imageFileName: 'large_post_3.jpg',
      ),
      Category(
        id: 104,
        title: 'Adventure',
        imageFileName: 'large_post_4.jpg',
      ),
      Category(
        id: 105,
        title: 'Artificial Intelligence',
        imageFileName: 'large_post_5.jpg',
      ),
      Category(
        id: 106,
        title: 'Economy',
        imageFileName: 'large_post_6.jpg',
      ),
    ];
  }
}
