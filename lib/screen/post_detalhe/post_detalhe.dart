import 'package:flutter/material.dart';
import '../../core/cores_padroes.dart';

class PostDetalheApp extends StatefulWidget {
  const PostDetalheApp({Key key}) : super(key: key);

  @override
  _PostDetalheState createState() => _PostDetalheState();
}

class _PostDetalheState extends State<PostDetalheApp> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        backgroundColor: Cores.backgroundAppBar,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_outlined),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Cores.backgroundCard,
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              title: Text('Neque porro quisquam est'),
              subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a ex eget metus rutrum ultricies. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent maximus eu urna non mollis. Fusce dapibus turpis quis hendrerit iaculis. Aliquam vitae tortor nibh. Quisque maximus lobortis neque, quis semper mi sodales at. Integer vitae malesuada turpis. Aenean dignissim, tortor a aliquam volutpat, nunc quam dignissim neque, non facilisis ex urna ut lacus. Praesent volutpat tincidunt nulla, vitae laoreet massa ornare et. Suspendisse laoreet eleifend massa, et scelerisque eros tempus nec. Etiam porttitor orci ac tortor tristique accumsan. Vestibulum vel dui volutpat, pretium urna.',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Cores.backgroundCard,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Text('Comentarios: '),
                Container(
                  // width: double.maxFinite,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Cores.backgroundComeent),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 30),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a ex eget metus rutrum ultricies. Interdum et malesuada fames ac ante ipsum primis in faucibus. ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.send),
                        hintText: 'Digite um comentario',
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
