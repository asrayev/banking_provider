import 'package:banking_provider/utils/my_images.dart';

class MyIcon{
  static const card = "assets/icons/card.svg";
  static const cardbg = "assets/icons/cardbg.svg";
  static const american = "assets/icons/cards/american.svg";
  static const maestro = "assets/icons/cards/maestro.svg";
  static const mastercard = "assets/icons/cards/mastercard.svg";
  static const visa = "assets/icons/cards/visa.svg";

  static getIcon(String name){
    switch(name){
      case "VISA":
        return visa;
        break;
      case "MasterCard":
        return mastercard;
        break;
      case "Maestro":
        return maestro;
        break;
      case "Amerikan Express":
        return american;
        break;
      case "Uzcard":
        return MyImages.uzcard;
        break;
      case "Humo":
        return MyImages.uzcard;
        break;
    }
  }

}