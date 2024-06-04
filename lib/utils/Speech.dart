
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


class Speech{
    //createa  constructor for this class
    bool _speechEnabled = false;
    List<String> uniqueSentences = [];
    String lastRecognizedWords = '';
    String works_text = '';
    List<String> List_text = [];
    
    String _lastWords = '';
    bool _isListening = false;
    late SpeechToText _speechToText;
    constructor(){
     _speechToText = SpeechToText();

    }



  //TODO: complete the speech to text and show it using the logern algorithm uasednin the hackthon
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    // setState(() {
    //   _startListening();
    // });
  }

  void _startListening() async {
    if (_isListening) {
      _isListening = true;
      while (_isListening) {
        await _speechToText.listen(
          onResult: _onSpeechResult,
          localeId: 'en-UK',
        );
      }
    }
    // setState(() {
    //   _isListening = true;
    //   _startListening();
    // });
  }

  void _stopListening() async {
    if (_isListening) {
      _isListening = false;
      await _speechToText.stop();
      // setState(() {});
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    
      _lastWords = result.recognizedWords;
      List_text.add(result.recognizedWords);
      if (result.finalResult) {
        String recognizedWords = result.recognizedWords;

        if (recognizedWords != lastRecognizedWords) {
          if (!uniqueSentences.contains(recognizedWords)) {
            
              uniqueSentences.add(recognizedWords);
            
          }
          lastRecognizedWords = recognizedWords;
        }
      }
      
      /* _textController.text =
          LinkedHashSet<String>.from(List_text).toList().join(" ");
      _textController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));*/
      _isListening = true;
    
  }
  

}