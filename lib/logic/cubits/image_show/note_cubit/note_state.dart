part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteTapping extends NoteState {
  final TextEditingController controller;

  NoteTapping({required this.controller});
}
