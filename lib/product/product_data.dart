class Product {
  final int id;
  final String name;
  final String image;
  final String type;
  final String description;
  final double price;

  const Product(
      {required this.id,
      required this.name,
      required,
      required this.image,
      required this.type,
      required this.description,
      required this.price});

  static const List<Product> products = [
    Product(
        id: 1,
        name: "Creter Impact",
        image: "assets/shoes_1.png",
        type: "Men's Shoes",
        description: "men shoes",
        price: 99.56),
    Product(
        id: 2,
        name: "Basketball",
        image: "assets/shoes_2.png",
        type: "Men's Shoes",
        description: "men shoes",
        price: 137.56),
    Product(
        id: 3,
        name: "Running",
        image: "assets/shoes_3.png",
        type: "Men's Shoes",
        description: "men shoes",
        price: 99.56),
    Product(
        id: 4,
        name: "Rugby",
        image: "assets/shoes_4.png",
        type: "Men's Shoes",
        description: "men shoes",
        price: 212.56),
  ];
}
