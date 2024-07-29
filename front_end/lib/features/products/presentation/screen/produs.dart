import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget {
    final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final List<dynamic> images;
    MyApp1({
   required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.images,
  });


  // قائمة من العناصر
  final List<Item> items = [
    Item(
        'Item 1',
        'https://cdn.dummyjson.com/products/images/groceries/Cat%20Food/1.png',
        10.0),
    Item('Item 2', 'https://via.placeholder.com/150', 20.0),
    Item('Item 3', 'https://via.placeholder.com/150', 30.0),
    Item('Item 4', 'https://via.placeholder.com/150', 40.0),
    Item('Item 5', 'https://via.placeholder.com/150', 50.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cards from List'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            childAspectRatio: 2 / 3, // نسبة العرض إلى الارتفاع
            crossAxisSpacing: 10, // المسافة الأفقية بين البطاقات
            mainAxisSpacing: 10, // المسافة العمودية بين البطاقات
          ),
          padding: EdgeInsets.all(10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // تنفيذ حدث عند الضغط على البطاقة
                print('Card ${items[index].name} pressed');
              },
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      items[index].imagePath,
                      fit: BoxFit.cover,
                      height: 100,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${items[index].price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      items[index].name,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String imagePath;
  final double price;

  Item(this.name, this.imagePath, this.price);
}
