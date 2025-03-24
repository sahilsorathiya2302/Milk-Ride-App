import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/auth/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
}
