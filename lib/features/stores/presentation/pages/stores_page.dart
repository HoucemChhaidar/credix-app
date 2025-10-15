import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/features/stores/presentation/widgets/stores_list_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StoresPage extends StatefulWidget {
  const StoresPage({super.key});

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  String _selectedType = 'All';
  String _searchQuery = '';

  final List<StoreResponse> _stores = [
    StoreResponse(
      id: '1',
      name: 'Fresh Market',
      description: 'Your local grocery store with fresh produce',
      address: '123 Main Street, Downtown',
      latitude: 36.8065,
      longitude: 10.1815,
      imageUrl: 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=400',
      tags: ['Grocery', 'Fresh', 'Organic'],
      type: 'Grocery',
      phone: '+21612345678',
      rating: 4.5,
      distance: 2.3,
    ),
    StoreResponse(
      id: '2',
      name: 'Tech World',
      description: 'Latest electronics and gadgets',
      address: '456 Tech Avenue, Business District',
      latitude: 36.8080,
      longitude: 10.1790,
      imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
      tags: ['Electronics', 'Gadgets', 'Tech'],
      type: 'Electronics',
      phone: '+21698765432',
      rating: 4.2,
      distance: 1.8,
    ),
    StoreResponse(
      id: '3',
      name: 'Fashion Hub',
      description: 'Trendy clothing and accessories',
      address: '789 Fashion Road, Shopping Center',
      latitude: 36.8050,
      longitude: 10.1830,
      imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400',
      tags: ['Clothing', 'Fashion', 'Accessories'],
      type: 'Fashion',
      phone: '+21655667788',
      rating: 4.7,
      distance: 3.1,
    ),
    StoreResponse(
      id: '4',
      name: 'MediCare Pharmacy',
      description: 'Your trusted pharmacy for health needs',
      address: '321 Health Street, Medical District',
      latitude: 36.8090,
      longitude: 10.1820,
      imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400',
      tags: ['Pharmacy', 'Health', 'Medicine'],
      type: 'Pharmacy',
      phone: '+21611223344',
      rating: 4.8,
      distance: 0.5,
    ),
    StoreResponse(
      id: '5',
      name: 'Burger Palace',
      description: 'Delicious burgers and fast food',
      address: '654 Food Court, Entertainment Zone',
      latitude: 36.8070,
      longitude: 10.1800,
      imageUrl: 'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=400',
      tags: ['Restaurant', 'Fast Food', 'Burgers'],
      type: 'Restaurant',
      phone: '+21699887766',
      rating: 4.3,
      distance: 1.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.h1('Stores'),
        const SizedBox(height: AppSizes.md),
        StoresListCard(
          stores: _stores,
          selectedType: _selectedType,
          onTypeChanged: (type) => setState(() => _selectedType = type),
          searchQuery: _searchQuery,
          onSearchChanged: (query) => setState(() => _searchQuery = query),
        ),
      ],
    );
  }
}
