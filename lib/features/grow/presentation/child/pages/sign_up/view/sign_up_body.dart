import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/widgets/form_widget/form_widgets_bucket.dart';

import 'package:grow_run_v1/features/grow/presentation/pages/splash_page.dart';
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
  //TODO implement a error snack bar and dialog
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildSignUpCubit, ChildSignUpState>(
        listener: (BuildContext context, ChildSignUpState state) {
      if (state.status.isFetchingDataUnsuccessfully() ||
          state.status.isSubmittedFormUnsuccessfully()) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.error ?? 'Problem Child'),
            backgroundColor: Colors.red,
          ));
      }
    }, builder: (BuildContext context, ChildSignUpState state) {
      //if either the form data is being fetched or the form being submitted
      //show the splash page
      if (state.status.isFetchingData() || state.status.isSubmittingForm()) {
        return SplashPage();
      } //if the data were retrived then show the form pages
      // else if (state.status.isFetchingDataSuccessfully()) {
      else {
        return getLoadedBody(context, state, pageNumber, () {
          setState(() {
            if (pageNumber < state.formGroups.length - 1) {
              ++pageNumber;
            }
          });
        });
      }
      // } else {
      //   return const Text('Problem getting the data');
      // }
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
///Returns a [widget]
Widget getFormPage(int pageNumber, ChildSignUpState state) {
  switch (pageNumber) {
    case 0:
      return ChildSignUpFormOne(formgroup: state.formGroups[pageNumber]);
    case 1:
      return ChildSignUpFormTwo(
        formGroup: state.formGroups[pageNumber],
        schools: state.schoolsList,
      );
    case 2:
      return ChildSignUpFormThree(formGroup: state.formGroups[pageNumber]);
    default:
      return Platform.isAndroid
          ? const CircularProgressIndicator()
          : const CupertinoActivityIndicator();
  }
}
