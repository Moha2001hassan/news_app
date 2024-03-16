import 'package:flutter/material.dart';

class SearchBarTextField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBarTextField({super.key, required this.onSearch});

  @override
  State<SearchBarTextField> createState() => _SearchBarTextFieldState();
}

class _SearchBarTextFieldState extends State<SearchBarTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    _controller.addListener(() {
      setState(() {
        _showClearIcon = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          widget.onSearch(value);
          _focusNode.unfocus();
        },
        decoration: InputDecoration(
          labelText: 'Search',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _showClearIcon
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                )
              : const Icon(Icons.filter_alt_rounded),
        ),
        onTap: () {
          setState(() {
            _focusNode.requestFocus();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
