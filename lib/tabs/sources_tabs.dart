import 'package:flutter/material.dart';
import 'package:news_app/models/source_resspond/source.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> source;
  const SourcesTabs(this.source,{super.key, });

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.source.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.source
                    .map((source) => TabItem(
                          sourceName: source.name??'',
                          isSelected:
                              widget.source.indexOf(source) == selectedIndex
                                  ? true
                                  : false,
                        ))
                    .toList())),
        Expanded(child: NewsList(widget.source[selectedIndex].id!))
      ],
    );
  }
}
