import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFFFFF9E7), Colors.white.withOpacity(0)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Header: Hello, Shreya Shah & Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello,', style: TextStyle(color: Colors.grey, fontSize: 14)),
                              Text('Shreya Shah', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87)),
                            ],
                          ),
                          Row(
                            children: [
                              _buildHeaderIcon(Icons.shopping_cart_outlined),
                              _buildHeaderIcon(Icons.translate),
                              _buildHeaderIcon(Icons.notifications_none),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                // --- SCROLLABLE CONTENT ---
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        // Big Sale Banner
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF2994A), Color(0xFFF2C94C)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Big Sale', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                Text('Up to 50%', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Spacer(),
                                Text('Happening Now', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [_dot(true), _dot(false), _dot(false), _dot(false)],
                        ),
                        const SizedBox(height: 25),
                        // OUR SERVICES
                        _sectionHeader('OUR SERVICES', showViewAll: false),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _serviceItem('Mobile Recharge', Icons.phone_android, Colors.purple),
                            _serviceItem('Fastag Recharge', Icons.directions_car, Colors.green),
                            _serviceItem('Gas Cylinder', Icons.local_gas_station, Colors.red),
                          ],
                        ),
                        const SizedBox(height: 25),
                        // CATEGORIES
                        _sectionHeader('CATEGORIES', showViewAll: true),
                        const SizedBox(height: 15),
                        // Horizontal scroll for categories
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              _categoryItem('Electronics', Icons.smartphone),
                              const SizedBox(width: 15),
                              _categoryItem('Fashion', Icons.shopping_bag_outlined),
                              const SizedBox(width: 15),
                              _categoryItem('Furniture', Icons.chair_outlined),
                              const SizedBox(width: 15),
                              _categoryItem('Appliances', Icons.tv),
                              const SizedBox(width: 15),
                              _categoryItem('Beauty', Icons.face_retouching_natural),
                              const SizedBox(width: 15),
                              _categoryItem('Toys', Icons.toys_outlined),
                              const SizedBox(width: 15),
                              _categoryItem('Grocery', Icons.local_grocery_store_outlined),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        // NEARBY VENDOR
                        _sectionHeader('NEARBY VENDOR', showViewAll: true),
                        const SizedBox(height: 15),
                        _vendorCard(
                          name: 'Velvet & Oak',
                          loc: 'Austin, TX',
                          rating: '4.8',
                          desc: 'Handmade wooden pieces inspired by the beauty of the Pacific Northwest.',
                          discount: '25% OFF',
                        ),
                        _vendorCard(
                          name: 'Maple & Pine',
                          loc: 'Seattle, WA',
                          rating: '4.5',
                          desc: 'Crafting sustainable furniture with a modern twist to elevate your living space.',
                        ),
                        _vendorCard(
                          name: 'Cedar & Stone',
                          loc: 'Denver, CO',
                          rating: '4.7',
                          desc: 'Expert artisans blending rustic charm with contemporary design aesthetics.',
                        ),
                        _vendorCard(
                          name: 'Birch & Grain',
                          loc: 'Portland, OR',
                          rating: '4.3',
                          desc: 'Handmade wooden pieces inspired by the beauty of the Pacific Northwest.',
                        ),
                        const SizedBox(height: 25),
                        // VENUE TYPES
                        _sectionHeader('VENUE TYPES', showViewAll: true),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              _venueTypeItem('Banquet Hall', 'assets/images/banquet.png'),
                              _venueTypeItem('Wedding Venues', 'assets/images/wedding.png'),
                              _venueTypeItem('Event Halls', 'assets/images/event.png'),
                              _venueTypeItem('Party Plots', 'assets/images/party.png'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Icon(icon, color: Colors.black54, size: 24),
      );

  Widget _dot(bool active) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: active ? 18 : 6,
        height: 6,
        decoration: BoxDecoration(
          color: active ? Colors.orange : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      );

  Widget _sectionHeader(String title, {bool showViewAll = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 13)),
        if (showViewAll)
          const Text('VIEW ALL', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _serviceItem(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 70, height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 11, color: Colors.black87)),
      ],
    );
  }

  Widget _categoryItem(String title, IconData icon) {
    return Column(
      children: [
        Container(
          width: 65, height: 50,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Icon(icon, size: 24, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black87)),
      ],
    );
  }

  Widget _vendorCard({
    required String name,
    required String loc,
    required String rating,
    required String desc,
    String? discount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A), // Dark blue/black
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.yellow, width: 2),
            ),
            child: const Center(
              child: Text(
                '10',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (discount != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107), // Amber
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          discount,
                          style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD54F), // Light amber
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 10, color: Colors.white),
                          Text(
                            ' $rating',
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 2),
                    Text(
                      loc,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.black54, fontSize: 11, height: 1.3),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _venueTypeItem(String title, String imagePath) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 90,
              width: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 90,
                  width: 110,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
