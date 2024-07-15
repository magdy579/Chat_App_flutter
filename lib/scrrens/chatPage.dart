
import 'package:chatapp/constes/constk.dart';
import 'package:chatapp/models/massege.dart';
import 'package:chatapp/widget/ChatWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  static String id = 'ChatPage' ;
   final  _controller = ScrollController();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messagess =
  FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller =   TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments == null ? "NULL":ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messagess.orderBy(KcreatData,descending: true).snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<Message>messageList =[];
          for(int i =0;i<snapshot.data!.docs.length;i++){
             messageList.add(Message.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kprimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kImage,
                    height: 50,
                  ),
                  const Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount:messageList.length,
                      itemBuilder: (context,index){
                        return messageList[index].id == email ?  ChatWeadget(
                          message: messageList[index],
                        ) : ChatWeadget1(message: messageList[index]);
                    }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messagess.add({
                        kMessage :data,
                        KcreatData:DateTime.now(),
                        'id': email,
                      });
                      controller.clear();
                      _controller.animateTo(
                        0 ,

                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send message',
                      suffixIcon: ElevatedButton(
                        onPressed: () {

                        },
                        child: const Icon(Icons.send,
                          color: kprimaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: kprimaryColor
                        ),
                      ) ,
                    ),
                  ),
                ),
              ],
            ),
          );
        }else{
          return const Text('Loading...') ;
        }
    },
    );
  }
}


