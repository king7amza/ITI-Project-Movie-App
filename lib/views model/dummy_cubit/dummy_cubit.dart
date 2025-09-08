import 'package:flutter_bloc/flutter_bloc.dart';

part 'dummy_state.dart';

class DummyCubit extends Cubit<DummyState> {
  DummyCubit() : super(DummyInitial());
}
