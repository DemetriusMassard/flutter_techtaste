class Category {
  Category({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  String id;
  String name;
  String imagePath;

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'imagePath': imagePath};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return "Category(id: $id, name: $name, imagePath: $imagePath)";
  }
}
