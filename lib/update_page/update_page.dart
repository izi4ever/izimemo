import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/widgets/custom_scaffold.dart';
import 'package:izimemo/update_page/update_controller.dart';
import 'package:izimemo/update_page/update_model.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateController updateController = Get.put(UpdateController());
    var updateData = updateController.updateModel;
    return CustomScaffold(
      appBarTitle: 'update_page'.tr,
      // child: Center(child: Text('update_page'.tr)),
      child: Column(
        children: [
          Text('updateData.comment.en'),
        ],
      ),
    );
  }
}
