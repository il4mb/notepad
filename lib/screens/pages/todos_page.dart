import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/color_scheme.dart';
import '../../widgets/search_input.dart';
import '../../widgets/todos_card.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late TextEditingController _inputSearchController;
  @override
  void initState() {
    super.initState();
    _inputSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          controller: _inputSearchController,
          hint: 'Search todos',
          onChanged: (query) {
            log('search: $query');
          },
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 4,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => Slidable(
              key: ValueKey(index),
              endActionPane: ActionPane(
                extentRatio: 0.18,
                motion: ScrollMotion(),
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: dangerColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset('assets/icons/trash.svg'),
                    ),
                  )
                ],
              ),
              child: TodosCard(),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8,),
          ),
        )
      ],
    );
  }
}

