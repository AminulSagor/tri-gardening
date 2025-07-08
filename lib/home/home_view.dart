import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../about_us/about_us_view.dart';
import '../chat/chat_view.dart';
import '../message/message_view.dart';
import '../product_details/product_details_view.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isWeb = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "TriGardening",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: isWeb
            ? [
          TextButton(
            onPressed: () => Get.to(() => ChatView()),
            child: const Text("Message Us", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () => Get.to(() => const AboutUsView()),
            child: const Text("About Us", style: TextStyle(color: Colors.black)),
          ),
        ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildFilterTabs(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: controller.products.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisExtent: 280,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (_, index) {
                  final product = controller.products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = ["All", "Flower", "Seeds", "Other"];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: index == 0 ? Colors.green : Colors.white,
              foregroundColor: index == 0 ? Colors.white : Colors.black,
              side: const BorderSide(color: Colors.green),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: Text(filters[index]),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(product['image'], fit: BoxFit.contain),
          ),
          const SizedBox(height: 12),
          Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text("\$${product['price']}", style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Get.to(() => ProductDetailsView(product: product));
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("View Details", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
