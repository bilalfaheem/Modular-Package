import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/communication/chat_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class ChatValidator {
  Either<ValidationFailure, ChatEntity> validate(ChatEntity data) {
    if (Validator.validateEmail(data.sender) != null) {
      return left(
          ValidationFailure(error: Validator.validateEmail(data.sender)!));
    } else {
      return right(data);
    }
  }
}
