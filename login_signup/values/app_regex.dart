class AppRegex {
  const AppRegex._(); // Kurucu fonksiyonu gizler

  static final RegExp emailRegex = RegExp(
      // E-posta adreslerini doğrulamak için kullanılan düzenli ifade
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.([a-zA-Z]{2,})+");
  static final RegExp passwordRegex = RegExp(
      // Parolaları doğrulamak için kullanılan düzenli ifade
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&_])[A-Za-z\d@#$!%*?&_].{7,}$');
}
