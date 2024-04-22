// ignore: constant_identifier_names
enum RoomType { SINGLE_CHAT, GROUP_CHAT }

// ignore: constant_identifier_names
enum RoomStatus { HIDDEN, ACTIVE, INACTIVE }

class Room {
  String objectId;
  String roomId;
  int numberOfUnreadMessage;
  String name;
  String receiverId;
  String senderId;
  RoomType roomType;
  bool sender;
  DateTime time;
  String latestMessage;
  String avatar;
  RoomStatus roomStatus;

  Room({
    required this.objectId,
    required this.roomId,
    required this.numberOfUnreadMessage,
    required this.name,
    required this.receiverId,
    required this.senderId,
    required this.roomType,
    required this.sender,
    required this.time,
    required this.latestMessage,
    required this.avatar,
    required this.roomStatus
  });

  factory Room.fromJson(Map<String, dynamic> map) {
    return Room(
      objectId: map["objectId"], 
      roomId: map["roomId"], 
      numberOfUnreadMessage: map["numberOfUnreadMessage"], 
      name: map["name"], 
      receiverId: map["receiverId"], 
      senderId: map["senderId"], 
      roomType: map["roomType"], 
      sender: map["sender"], 
      time: map["time"], 
      latestMessage: map["latestMessage"], 
      avatar: map["avatar"], 
      roomStatus: map["roomStatus"]
    );
  }

  

  @override
  int get hashCode => objectId.hashCode;
  
  @override
  bool operator == (Object other) {
    return identical(this, other) || other is Room && 
    runtimeType == other.runtimeType &&
    objectId == other.objectId;
  }

}
