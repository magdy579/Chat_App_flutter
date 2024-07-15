import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  Future<void> loginUser({required String email,required String password}) async {
    emit(LogInLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LogInSuccess());
    }
    on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LogInFailure(errMessage: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {

        emit(LogInFailure(errMessage: 'Wrong password provided for that user'));
      }
    } catch (e) {
      emit(LogInFailure(errMessage: 'Something went Wrong'));
    }
  }
}
