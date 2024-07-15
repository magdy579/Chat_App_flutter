import 'package:bloc/bloc.dart';
import 'package:chatapp/cubit/log_in_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'regessstar_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> Regesteration({required String email,required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    }
    on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
      }
      else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'The account already exists for that email.'));
      }
    }catch (e) {
      emit(RegisterFailure(errMessage: 'Something went Wrong'));
    }
  }
}
