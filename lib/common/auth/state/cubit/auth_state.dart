part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticatedWithoutProfile() = _AuthenticatedWithoutProfile;
  const factory AuthState.authenticatedWithProfile(UserInterface user) = _AuthenticatedWithProfile;
  const factory AuthState.error(String message) = _Error;
}
