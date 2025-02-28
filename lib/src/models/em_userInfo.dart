import '../internal/inner_headers.dart';

///
/// The EMUserInfo class, which contains the user attributes, such as the nickname, description, and avatar.
///
class EMUserInfo {
  ///
  /// Creates a user attribute.
  ///
  /// Param [userId] The username.
  ///
  EMUserInfo._private(
    this.userId, {
    this.nickName,
    this.avatarUrl,
    this.mail,
    this.phone,
    this.gender = 0,
    this.sign,
    this.birth,
    this.ext,
  });

  /// @nodoc
  factory EMUserInfo.fromJson(Map map) {
    EMUserInfo info = EMUserInfo._private(
      map["userId"],
      nickName: map.getStringValue("nickName"),
      avatarUrl: map.getStringValue("avatarUrl"),
      mail: map.getStringValue("mail"),
      phone: map.getStringValue("phone"),
      gender: map.getIntValue("gender", defaultValue: 0)!,
      sign: map.getStringValue("sign"),
      birth: map.getStringValue("birth"),
      ext: map.getStringValue("ext"),
    );
    return info;
  }

  /// @nodoc
  Map toJson() {
    Map data = Map();
    data['userId'] = userId;
    if (nickName != null) {
      data['nickName'] = nickName;
    }
    if (avatarUrl != null) {
      data['avatarUrl'] = avatarUrl;
    }
    if (mail != null) {
      data['mail'] = mail;
    }
    if (phone != null) {
      data['phone'] = phone;
    }
    data['gender'] = gender;
    if (sign != null) {
      data['sign'] = sign;
    }
    if (birth != null) {
      data['birth'] = birth;
    }
    if (ext != null) {
      data['ext'] = ext;
    }

    return data;
  }

  /// Gets the username.
  ///
  /// **Return**
  /// The user's username.
  ///
  final String userId;

  /// Gets the user's nickname.
  ///
  /// **Return**
  /// The user's nickname.
  ///
  final String? nickName;

  /// Gets the avatar URL of the user.
  ///
  /// **Return**
  /// The avatar URL of the user.
  ///
  final String? avatarUrl;

  /// Gets the email address of the user.
  ///
  /// **Return**
  /// The email address of the user.
  ///
  final String? mail;

  /// Gets the mobile numbers of the user.
  ///
  /// **Return**
  /// The mobile numbers of the user.
  ///
  final String? phone;

  /// Gets the user's gender.
  ///
  /// **Return**
  /// The user's gender:
  /// - `0`: (Default) UnKnow;
  /// - `1`: Male;
  /// - `2`: Female.
  ///
  final int gender;

  /// Gets the user's signature.
  ///
  /// **Return**
  /// The user's signature.
  ///
  final String? sign;

  /// Gets the user's data of birth.
  ///
  /// **Return**
  /// The user's data of birth.
  ///
  final String? birth;

  /// Gets the user's extension information.
  ///
  /// **Return**
  /// The user's extension information.
  ///
  final String? ext;

  /// Gets the time period(seconds) when the user attributes in the cache expire.
  /// If the interval between two callers is less than or equal to the value you set in the parameter, user attributes are obtained directly from the local cache; otherwise, they are obtained from the server. For example, if you set this parameter to 120(2 minutes), once this method is called again within 2 minutes, the SDK returns the attributes obtained last time.
  ///
  /// **Return**
  /// The time period(seconds) when the user attributes in the cache expire.
  ///
  final int expireTime = DateTime.now().millisecondsSinceEpoch;
}
