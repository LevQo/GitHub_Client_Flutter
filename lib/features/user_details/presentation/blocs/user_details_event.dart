import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'user_details_event.freezed.dart';

@freezed
abstract class UserDetailsEvent with _$UserDetailsEvent {
  const factory UserDetailsEvent.getDetails({@required String username}) = _GetDetails;
}
