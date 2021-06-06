import 'package:flutter/material.dart';

void showDraggableScreen(BuildContext context, Widget screen) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.40,
        initialChildSize: 0.40,
        builder: (context, scrollController) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: Container(color: Colors.grey[100], child: screen)),
            ),
          );
        },
      );
    },
  );
}