import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/provider/search_state.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
      color: Colors.brown[800],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: CupertinoTextField(
        onChanged: (value) {
          context.read<SearchState>().updateSearchContent(value);
        },
        decoration: BoxDecoration(
          color: Colors.brown[50],
          borderRadius: BorderRadius.circular(15),
        ),
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Colors.brown[800],
          ),
        ),
        placeholder: 'Поиск',
        style: TextStyle(fontFamily: 'Gilroy'),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
