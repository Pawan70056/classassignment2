import 'package:bloc/bloc.dart';

class AreaCircleCubit extends Cubit<double> {
  AreaCircleCubit() : super(0);

  void calculate(double radius) {
    emit(3.14159 * radius * radius);
  }
}
