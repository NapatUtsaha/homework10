import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'InfoModel.dart';
import 'comment.dart';

import 'comment.dart';
import 'Game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Test(),
    );
  }
}
class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<InfoModel> InfoReportLIst = [
    InfoModel(username: 'mudeng', imgProfile: 'mudeng.jpg', imgPost: 'plaichawak.png' , detail: '💢เย็นวันนี้มีเมนูในใจรึยัง..? \n.\n.\nให้น้ำพริกปลาจวักเป็นส่วนหนึ่งในมื้ออาหารของคุณสิ ❤️‍🔥\nนอกจากจะมีความเเซ่บเเละกลมกล่อม ยังเป็นเมนูที่ชช่วยลดน้ำหนักให้คุณได้ด้วย 🥬🥦🥒🫑🌶\n',
        cm: [comment(username: 'bobo', text: 'หิวจังกั้บ ขอที่อยู่แม่ค้าหน่อย'),comment(username: 'asurakai', text: 'มีน้ำพริกอะไรบ้างคะ พอดีจะเอามาจิ้มกับตัวเอง เผื่อจะได้แซ่บขึ้น'),comment(username: 'mudeng', text: '@asurakai inbox มาเพิ่มความแซ่บได้เลยค่า😉')]),
    InfoModel(username: 'bobo', imgProfile: 'bo.jpg', imgPost: 'bo2.jpg' , detail: 'เบื่อการนั่งบนชักโครก อยากลองเข้าไปนั่งในใจเธอ',
        cm: [comment(username: 'mudeng', text: 'น่ารักจังเลยค่ะ ขอไลน์หน่อย'),comment(username: 'wanwan', text: 'นั่งบนกระทะในนรก'),comment(username: 'putyourhansup', text: '@wanwan ทำไมวั่นต้องว่าเพื่อนด้วยอะ แย่มาก!')] ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Velvet')),
      body: ListView.builder(
          itemCount: InfoReportLIst.length,
          itemBuilder: (context, index) =>
              MyCard(info: InfoReportLIst[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final InfoModel info;

  MyCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String result='';
  bool addFavorite = false;
  final TextEditingController _textController = new TextEditingController();
  String str(){
    result='';
    for (var i = 0; i < widget.info.cm.length; i++) {
      result+=widget.info.cm[i].username+' '+widget.info.cm[i].text+'\n';
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),

      ),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child:Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: ExactAssetImage('assets/images/${widget.info.imgProfile}'),
                          )
                      )),
                ),
                Text(widget.info.username),
                Expanded(
                  child: Container(
                    width: 50,
                  ),
                ),
                IconButton(
                  iconSize: 25,
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Image.asset('assets/images/${widget.info.imgPost}', width: 250.0, fit: BoxFit.fill,),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.info.detail),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(str(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _textController,
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    prefixIcon:IconButton(
                        icon: Icon(addFavorite ? Icons.favorite : Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            addFavorite = !addFavorite;
                          });
                        }),
                    hintText: "Add a comment..",
                  ),
                  onSubmitted: (String str){
                    setState((){
                      widget.info.addComment('flutter', str);
                      _textController.clear();
                    });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}