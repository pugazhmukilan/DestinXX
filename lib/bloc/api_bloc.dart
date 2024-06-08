import 'package:bloc/bloc.dart';
import 'package:destin/API/api_request.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  Map <String,dynamic> blocresult = {};
  ApiBloc() : super(ApiInitial()) {
    
    on<ApiCall>((event, emit)async {
      
      emit(ApiFetchingReport());
       Callapi blocapicall = Callapi();
       try{
        blocresult = await blocapicall.fetchDataBloc(event.interviewQuestions, event.interviewAnswer);
       }catch(e){
        emit(ApiFailed(error: e.toString()));
       }
       emit(ApiFetchSuccessful(report: blocresult));
       
      
    
    });
  }
}
