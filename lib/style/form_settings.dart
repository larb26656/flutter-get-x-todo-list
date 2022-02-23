import 'package:reactive_forms/reactive_forms.dart';

class FormSettings {
  static bool defaultShowErrors(AbstractControl<dynamic> control) {
    return control.invalid && control.dirty;
  }
}