abstract class DTO<S> {
  final int status;
  final String message;

  DTO(this.status, this.message);

  S serialize();
}