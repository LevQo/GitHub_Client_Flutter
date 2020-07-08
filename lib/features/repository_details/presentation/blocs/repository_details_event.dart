import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_details_event.freezed.dart';

@freezed
abstract class RepositoryDetailsEvent with _$RepositoryDetailsEvent {
  const factory RepositoryDetailsEvent.getDetails({@required String owner, @required String repo}) = _GetDetails;
}
