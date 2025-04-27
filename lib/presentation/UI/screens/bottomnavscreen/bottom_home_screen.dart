import 'package:flutter/material.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/appbar_elements.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/category_card.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/home_sider.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/product_card.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/search_bar.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/section_header.dart';

class BottomHomeScreen extends StatelessWidget {
  const BottomHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const AppbarElements(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSearchBar(),
              const SizedBox(height: 16),
              HomeSlider(),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Categories',
                onTap: () {},
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CategoryCard();
                  },
                ),
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              SizedBox(
                height: 142,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 142,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 142,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
