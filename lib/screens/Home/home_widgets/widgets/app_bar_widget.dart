import 'package:anamel/core/const/app_words.dart';
import 'package:anamel/screens/home/home_widgets/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showSearch;
  final TextEditingController searchController;
  final Function() onToggleSearch;
  final Function(String) onSearchChanged;
  final String searchQuery;

  const CustomAppBar({
    Key? key,
    required this.showSearch,
    required this.searchController,
    required this.onToggleSearch,
    required this.onSearchChanged,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: widget.showSearch ? _buildSearchField() : _buildTitle(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildSearchField() {
    return SearchField(
      controller: widget.searchController,
      onChanged: widget.onSearchChanged,
    );
  }

  Widget _buildTitle() {
    return const Text(
      AppWords.anamel,
      style: TextStyle(
        color: Color.fromARGB(255, 93, 96, 70),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (widget.showSearch) {
      return [
        IconButton(
          onPressed: widget.onToggleSearch,
          icon: const Icon(Icons.close, color: Color.fromARGB(255, 93, 96, 70)),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: widget.onToggleSearch,
          icon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 93, 96, 70),
          ),
        ),
      ];
    }
  }
}
