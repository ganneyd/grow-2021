import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';

///All Form Group implements this to return to a widget if the form is valid
///or not
abstract class GetFormValidation {
  ///Returns the status of the form
  bool isValid();
}
