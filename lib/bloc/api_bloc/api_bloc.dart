import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  Map <String,dynamic> blocresult = {};
  
  ApiBloc() : super(ApiInitial()) {
    
    on<ApiCall>((event, emit)async {
      
      emit(ApiFetchingReport());
      //  Callapi blocapicall = Callapi();
      //  try{
      //   blocresult = await blocapicall.fetchDataBloc(event.interviewQuestions, event.interviewAnswer);
      //  }catch(e){
      //   emit(ApiFailed(error: e.toString()));
      //  }
      //  emit(ApiFetchSuccessful(report: blocresult));
       try {
         List<String>  questions = event.interviewQuestions;
         List<String>  answers =  event.interviewAnswer;
        final response = await http.post(
          Uri.parse('https://karthiksagar.us-east-1.modelbit.com/v1/predict/latest'),
          body: json.encode({
            'data': [
              questions[0],
              answers[0],
              questions[1],
              answers[1],
              questions[2],
              answers[2],
              questions[3],
            answers[3],
              questions[4],
              answers[4],
              questions[5],
              answers[5],
              questions[6],
              answers[6],
            ]
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final decodedResponse = json.decode(response.body);
          emit(ApiFetchSuccessful(report: decodedResponse));
          print("${response.statusCode}");
          print(decodedResponse.runtimeType);
          print(decodedResponse);
          //print(calculateOverallScore(decodedResponse));
          return decodedResponse;
        } else {
          print('Request failed with status: ${response.statusCode}');
          emit(ApiFailed(error: 'Request failed with status: ${response.statusCode}'));
          // Set loading indicator to false if request fails
          // return [];
          return null;
        }
      } catch (e) {
        print('Exception during API call: $e');
        emit(ApiFailed(error: 'Request failed with status: ${e}'));
        // Set loading indicator to false if exception occurs
        return null;
      }
      
    
    });
  }
}
