import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_1.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_2.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_3.dart';
part 'sign_up_body_loaded.dart';
part 'sign_up_body_loading.dart';
part 'sign_up_body_submitting.dart';

///
class SignUpPageBody extends StatefulWidget {
  ///
  const SignUpPageBody() : super(key: const Key('sign_up_body_child'));

  @override
  _SignUpPageBodyState createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  int pageNumber = 0;

  Map<String, dynamic> formJson = {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildSignUpCubit, ChildSignUpState>(
        listener: (BuildContext context, ChildSignUpState state) {
      if (state.fetchingData) {}
    }, builder: (BuildContext context, ChildSignUpState state) {
      return getLoadedBody(context, state, pageNumber, () {
        setState(() {
          if (pageNumber < state.formGroups.length - 1) {
            ++pageNumber;
          }
        });
      });
    });
  }
}

// Widget _getButton(ChildSignUpState state, int pageNumber, Function) {
//  return ElevatedButton(
//                         onPressed: () {
//                           if (state.formGroups[pageNumber].valid) {
//                             setState(() {
//                               if (pageNumber < state.formGroups.length - 1) {
//                                 ++pageNumber;
//                               }
//                             });
//                           }

//                           print("i'm not valid");
//                           ScaffoldMessenger.of(context)
//                             ..hideCurrentSnackBar()
//                             ..showSnackBar(const SnackBar(
//                               content: Text('Please fill out the form'),
//                               backgroundColor: Colors.red,
//                             ));
//                         },
//                         child: const Text('Continue'),
//                       )
// }

Widget getFormPage(int pageNumber, ChildSignUpState state) {
  switch (pageNumber) {
    case 0:
      return ChildSignUpFormOne(formgroup: state.formGroups[pageNumber]);
    case 1:
      return ChildSignUpFormTwo(
        formGroup: state.formGroups[pageNumber],
        schools: [SchoolModel(name: 'St.Martin'), SchoolModel(name: 'St.Joe')],
      );
    case 2:
      return ChildSignUpFormThree(formGroup: state.formGroups[pageNumber]);
    default:
      return Container(
        child: const CircularProgressIndicator(),
      );
  }
}
