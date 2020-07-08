import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';

abstract class UserDetailsRepository{
  Future<UserDetailsEntity> getUserDetails(String username);
}