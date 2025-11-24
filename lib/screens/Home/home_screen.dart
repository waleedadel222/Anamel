import 'package:anamel/screens/home/home_service/services/Search_service/search_service.dart';
import 'package:anamel/screens/home/home_widgets/widgets/home_content_widget.dart';
import 'package:anamel/screens/home/home_widgets/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'home_widgets/widgets/app_bar_widget.dart';
import 'home_widgets/widgets/promo_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
      if (!_showSearch) {
        _searchController.clear();
        _searchQuery = '';
      }
    });
  }

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<dynamic> _getFilteredProducts() {
    final allProducts = SearchService.getAllProducts();
    return SearchService.searchProducts(_searchQuery, allProducts);
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = _getFilteredProducts();

    return Scaffold(
      appBar: CustomAppBar(
        showSearch: _showSearch,
        searchController: _searchController,
        onToggleSearch: _toggleSearch,
        onSearchChanged: _performSearch,
        searchQuery: _searchQuery,
      ),
      body: _buildBody(searchResults),
    );
  }

  Widget _buildBody(List<dynamic> searchResults) {
    if (_searchQuery.isNotEmpty) {
      return _buildSearchResults(searchResults);
    } else {
      return SingleChildScrollView(
        child: Column(children: [const PromoCarousel(), HomeContent()]),
      );
    }
  }

  Widget _buildSearchResults(List<dynamic> results) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ' result of search about "$_searchQuery" (${results.length})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (results.isEmpty)
            const NoResultsWidget()
          else
            SearchResultsGrid(results: results, searchQuery: _searchQuery),
        ],
      ),
    );
  }
}
