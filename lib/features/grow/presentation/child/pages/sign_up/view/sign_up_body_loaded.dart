part of 'sign_up_body.dart';

/// If the cubit was initialized successfully
Widget getLoadedBody(BuildContext context, ChildSignUpState state,
    int pageNumber, Function function) {
  return Column(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final Animation<Offset> inAnimation = Tween<Offset>(
                    begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(animation);
            final Animation<Offset> outAnimation = Tween<Offset>(
                    begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(animation);
            if (child.key == getFormPage(pageNumber, state).key) {
              return SlideTransition(
                position: inAnimation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            } else {
              return SlideTransition(
                position: outAnimation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }
          },
          child: getFormPage(pageNumber, state),
        ),
      ),
      Center(
        child: pageNumber < state.formGroups.length - 1
            ? ElevatedButton(
                onPressed: () {
                  if (state.formGroups[pageNumber].valid) {
                    function();
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text('Please fill out the form'),
                        backgroundColor: Colors.red,
                      ));
                  }
                },
                child: const Text('Continue'),
              )
            : ElevatedButton(
                onPressed: () {
                  if (state.formGroups[pageNumber].valid) {
                    context.read<ChildSignUpCubit>().signUpChildUser();
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text('Please fill out the form'),
                        backgroundColor: Colors.red,
                      ));
                  }
                },
                child: const Text('Submit'),
              ),
      ),
    ],
  );
}
