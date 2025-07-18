part of 'complete_profile_bloc.dart';

@immutable
class CompleteProfileState {
  final CompleteProfileInitialParams initialParams;
  final ApiResponse<BaseEntity<List<String>>> completeProfileResponse;

  const CompleteProfileState({
    required this.initialParams,
    this.completeProfileResponse = const ApiResponse.init(),
  });

  CompleteProfileState copyWith({
    CompleteProfileInitialParams? initialParams,
    ApiResponse<BaseEntity<List<String>>>? completeProfileResponse,
  }) {
    toString();
    return CompleteProfileState(
      initialParams: initialParams ?? this.initialParams,
      completeProfileResponse:
          completeProfileResponse ?? this.completeProfileResponse,
    );
  }

  @override
  String toString() {
    return 'CompleteProfileState(initialParams: $initialParams, complete_profileResponse: ${completeProfileResponse.toString()})';
  }
}
