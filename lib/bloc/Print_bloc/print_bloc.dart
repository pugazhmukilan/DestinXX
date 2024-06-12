import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'print_event.dart';
part 'print_state.dart';

class PrintBloc extends Bloc<PrintEvent, PrintState> {
  PrintBloc() : super(PrintInitial()) {
    on<PrintReport>((event, emit) {
      // TODO: implement event handler
      emit(PrintStarted());
      
    });
  }
}
