class Product {
  final int id;
  final String imgUrl;
  final String name;
  final double price;

  Product(
    this.id,
    this.imgUrl,
    this.name,
    this.price,
  );
}

List<Product> mockProducts() {
  return [
    Product(
        0,
        "https://img.alicdn.com/imgextra/i2/92521757/O1CN01jiNCvu1OqkTZr6Ues_!!0-saturn_solar.jpg_220x220.jpg_.webp",
        "Dyson戴森吹风机Supersonic HD03",
        2990.0),
    Product(
        1,
        "https://img.alicdn.com/imgextra/i4/92521757/O1CN01z1yfYF1OqkTbueSBO_!!0-saturn_solar.jpg_220x220.jpg_.webp",
        "Dyson戴森HP05取暖器",
        5090),
    Product(
        2,
        "https://img.alicdn.com/imgextra/i3/783537643/TB2SfeAkwKTBuNkSne1XXaJoXXa_!!783537643-2-beehive-scenes.png_180x180xzq90.jpg_.webp",
        "日本fillico神户矿泉水",
        2580.0),
    Product(
        3,
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/1085315961/O1CN01agP7G91tuBXHeypWE_!!0-item_pic.jpg_250x250.jpg_.webp",
        "Razer雷蛇灵刃",
        10999.0),
    Product(
        4,
        "https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/725677994/O1CN01urjBNf28vIje3Y3hV_!!0-item_pic.jpg_250x250.jpg_.webp",
        "华为HONOR 荣耀20",
        2499.0),
  ];
}
