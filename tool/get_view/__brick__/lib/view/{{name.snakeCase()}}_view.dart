import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service/components/buttons/app_back_button.dart';
import 'package:service/components/buttons/app_icon_button.dart';
import 'package:service/components/content.dart';
import 'package:service/resources/app_asset.dart';
import 'package:service/resources/app_color.dart';
import 'package:service/resources/app_text_style.dart';
import 'package:service/view_model/{{name.snakeCase()}}_view_model.dart';



class {{name.pascalCase()}}View extends StatefulWidget {
  final {{name.pascalCase()}}ViewModel viewModel;
  {{name.pascalCase()}}View({
    super.key,
    required this.viewModel,
  });

  @override
  State<{{name.pascalCase()}}View> createState() => _{{name.pascalCase()}}ViewState();
}

class _{{name.pascalCase()}}ViewState extends State<{{name.pascalCase()}}View> {
  @override
  void didChangeDependencies() {
    widget.viewModel.context = context;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
