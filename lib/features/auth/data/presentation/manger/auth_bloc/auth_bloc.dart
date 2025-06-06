import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(
            LoginFailure(
              errorMessage: ServiceFailure.fromFirebaseAuth(e).errorMessage,
            ),
          );
        } catch (e) {
          emit(
            LoginFailure(errorMessage: "Something went wrong. Try again. $e"),
          );
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          var auth = FirebaseAuth.instance;
          // ignore: unused_local_variable
          UserCredential userData = await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(RegisterSuccessfully());
        } on FirebaseAuthException catch (ex) {
          emit(
            RegisterFailed(
              errorMessage: ServiceFailure.fromFirebaseAuth(ex).errorMessage,
            ),
          );
        } on Exception {
          emit(
            RegisterFailed(
              errorMessage: 'an unknown error occured please try again ',
            ),
          );
        }
      } else if (event is ResetEvent) {
        emit(ResetLoading());
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(
            email: event.email,
          );
          emit(ResetSuccess());
        } on FirebaseAuthException catch (ex) {
          emit(
            ResetFailure(
              errorMessage: ServiceFailure.fromFirebaseAuth(ex).errorMessage,
            ),
          );
        } on Exception {
          emit(
            ResetFailure(
              errorMessage: 'an unknown error occured please try again ',
            ),
          );
        }
      }
    });
  }
}
