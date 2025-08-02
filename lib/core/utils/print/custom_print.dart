import '../colorConsol/color_consol.dart';

customPrint(text, {error,exception}){
  if(error==true){
    print(error(pb(text)));
  }else if(exception==true){
    print(exception(pb(text)));
  }else{
    print(show(text));
  }
}
