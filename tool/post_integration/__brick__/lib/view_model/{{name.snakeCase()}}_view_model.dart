import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/{{name.snakeCase()}}_use_case.dart';
import 'package:service/utils/utils.dart';

class {{name.pascalCase()}}ViewModel extends GetxController {
  final {{name.pascalCase()}}UseCase _useCase;
  {{name.pascalCase()}}ViewModel(this._useCase);

  late BuildContext context;
  ApiResponse<{{name.pascalCase()}}DataModel> {{name.camelCase()}}Response = ApiResponse.init();

  set{{name.pascalCase()}}Response(ApiResponse<{{name.pascalCase()}}DataModel> response) {
    {{name.camelCase()}}Response = response;
    update();
  }

  {{name.camelCase()}}({{name.pascalCase()}}Entity data) {
    set{{name.pascalCase()}}Response(ApiResponse.loading());
    _useCase.execute(data).then((value) => value.fold((err) {
          set{{name.pascalCase()}}Response(ApiResponse.error(err.error));
          Utils.toastErrMessage(err.error, context);
          Utils.logError(err.error.toString(), name: "{{name.pascalCase()}} Repo Error");
        }, (res) {
          set{{name.pascalCase()}}Response(ApiResponse.completed(res));
          Utils.toastMessage(res.userMessage ?? "", context);
        }));
  }
}
