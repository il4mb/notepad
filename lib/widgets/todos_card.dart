import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color_scheme.dart';

class TodosCard extends StatelessWidget {
  const TodosCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: softGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/todo-unchecked.svg'),
          const SizedBox(width: 16,),
          Expanded(
            child: Text(
              'Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}