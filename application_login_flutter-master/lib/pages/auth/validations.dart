  //Regex para validaciones
  //FORM LOGIN AND REGISTER
final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{9,16}$');
final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
