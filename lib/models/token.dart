class Token {
  final String accessToken;
  final String refreshToken;

  const Token({required this.accessToken, required this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> map) {
    return Token(
      accessToken: map["accessToken"], 
      refreshToken: map["refreshToken"]
    );
  }
}