import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/createFormCubit.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CreateFormCubit>().createCustomScreen();
    return BlocBuilder<CreateFormCubit, CreateForm>(builder: (context, createForm) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                createForm.state == CreateFormState.DONE
                    ? createForm.getWidget??Container()
                    : Container(),
              ],
            ),
          ),
          Visibility(
              visible: createForm.state == CreateFormState.LOADING,
              child: const CircularProgressIndicator())
        ],
      );
    });
  }
}
