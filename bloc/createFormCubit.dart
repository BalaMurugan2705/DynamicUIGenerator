import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/CreateFormModel.dart';
import '../helper/helper.dart';

class CreateFormCubit extends Cubit<CreateForm> {
  CreateFormCubit() : super(CreateForm()) ;

  createCustomScreen() {
    emit(CreateForm(
      state: CreateFormState.LOADING,
      getWidget: const CircularProgressIndicator(),
    ));
    Future.delayed(const Duration(seconds: 2), () {
      readJson();
    });
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('template.json');
    final data = await json.decode(response);
    var getFormData = CreateFormModel.fromJson(data);
    var getFormWidget = createCustomForm(getFormData);
    emit(CreateForm(state: CreateFormState.DONE, getWidget: getFormWidget));
  }
}

enum CreateFormState { NONE, LOADING, DONE, ERROR }

class CreateForm {
  CreateFormState state;
  Widget? getWidget;

  CreateForm({
    this.state = CreateFormState.NONE,
    this.getWidget,
  });

  CreateForm copyWith({CreateFormState? state, Widget? getWidget}) {
    return CreateForm(
        state: state ?? this.state, getWidget: getWidget ?? this.getWidget);
  }
}
