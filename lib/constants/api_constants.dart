


///
/// Handle the api constants like base link and endpoints methods
///

abstract class ApiConstants {
  ApiConstants._();


  static const String baseLink = 'https://imdb8.p.rapidapi.com';


  static const String methodAutoComplete = '/auto-complete';
}

///
/// Handle the api queries, body and headers constants
///

abstract class ParametersConstants {
  ParametersConstants._();




  static const String kSearchQuery = 'q';
  static const String kRapidKey = 'X-RapidAPI-Key';
  static const String kRapidHost = 'X-RapidAPI-Host';



}
