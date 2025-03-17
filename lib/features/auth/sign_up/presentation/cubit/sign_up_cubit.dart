import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
