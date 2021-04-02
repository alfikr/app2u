import 'package:advertising/styles/app_theme.dart';
import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Tidak ada data",
          style: AppTheme().getTitle(),
        ),
      ),
    );
  }
}
