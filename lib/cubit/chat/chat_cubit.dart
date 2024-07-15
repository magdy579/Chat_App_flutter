import 'package:bloc/bloc.dart';
import 'package:chatapp/constes/constk.dart';
import 'package:chatapp/models/massege.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Message>messageList=[];
  CollectionReference messagess =
  FirebaseFirestore.instance.collection(kMessagesCollections);
  void sendMessage({required String  message,required String email}){
    messagess.add({
      kMessage :message,
      KcreatData:DateTime.now(),
      'id': email,
    });


  }
  void getMessage(){
messagess.orderBy(KcreatData,descending: true).snapshots().listen((event) {

messageList.clear();
  for(var doc in event.docs ){

    messageList.add(Message.fromjson(doc));
  }
  // print('succes');
  emit(ChatSuccess(message: messageList));
});
}
}
