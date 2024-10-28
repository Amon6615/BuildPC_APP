import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Image.asset(
              'assets/images/BUILDAPCLOGOSPLASH.png', // Replace with your logo path
              height: 40,
            ),
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.black),
            const SizedBox(width: 10),
            const Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('FOR YOU', 'Recommended'),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),
            const SizedBox(height: 20),
            _buildSectionHeader('Category', 'See All'),
            const SizedBox(height: 10),
            _buildCategoryList(),
            const SizedBox(height: 20),
            _buildSectionHeader('Flash Sale', 'See All', withTimer: true),
            const SizedBox(height: 10),
            _buildFlashSaleTabs(),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title, String actionText, {bool withTimer = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (withTimer)
          const Row(
            children: [
              Text('Closing In: 00:00:00', style: TextStyle(color: Colors.red)),
              SizedBox(width: 8),
            ],
          ),
        TextButton(
          onPressed: () {},
          child: Text(actionText, style: const TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }

  // Horizontal List of Products
  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => _buildProductCard(),
      ),
    );
  }

  // Product Card Widget
  Widget _buildProductCard() {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/images/product.png', // Replace with your product image
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Name', maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 5),
                Text('₱4,200', style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Category List
  Widget _buildCategoryList() {
    final categories = [
      {'icon': Icons.desktop_mac, 'label': 'Computer Monitor'},
      {'icon': Icons.computer, 'label': 'Pre Built PC'},
      {'icon': Icons.graphic_eq, 'label': 'Graphics Card'},
      {'icon': Icons.memory, 'label': 'RAM'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(category['icon'] as IconData, color: Colors.orange),
            ),
            const SizedBox(height: 5),
            Text(category['label'] as String, textAlign: TextAlign.center),
          ],
        );
      },
    );
  }

  // Flash Sale Tabs
  Widget _buildFlashSaleTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFlashSaleTab('All', isSelected: true),
        _buildFlashSaleTab('Newest'),
        _buildFlashSaleTab('Popular'),
        _buildFlashSaleTab('Selling Out'),
      ],
    );
  }

  // Flash Sale Tab Widget
  Widget _buildFlashSaleTab(String label, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}