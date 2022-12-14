import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/src/material/theme_data.dart';

class ScreenChat extends StatefulWidget {
  const ScreenChat({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenChatState();
}

String _name = "gao den";

class _ScreenChatState extends State<ScreenChat> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  late ScrollController _controller;

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      //"reach the bottom"
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      // "reach the top";
      setState(() {});
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.black38),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Widget _buildTextInput() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 8.0),
        decoration: myBoxDecoration(),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                minLines: 1,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null),
            ),
          ],
        ),
      );

  Widget _buildTextComposer() {
    return new IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new IconButton(
                icon: new Icon(Icons.photo_camera),
                onPressed: () => _handleTouchOnCamera()),
          ),
          new Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new IconButton(
                icon: new Icon(Icons.photo_library),
                onPressed: () => _handleTouchOnGalleryPhoto()),
          ),
          Expanded(
            child: _buildTextInput(),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    if (text.length > 0) {
      ChatMessage message = new ChatMessage(
        text: text,
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      setState(() {
        _messages.insert(0, message);
      });
      message.animationController.forward();
    }
  }

  void _handleTouchOnCamera() {}

  void _handleTouchOnGalleryPhoto() {}

  @override //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 8, 59, 101),
              child: CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage('images/gaoden.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                '${_name}',
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              controller: _controller,
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          // new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: SafeArea(
              bottom: true,
              child: _buildTextComposer(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {required this.text, required this.animationController}); //modified
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 8, 59, 101),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('images/frog.jpeg'),
                ),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('frog', style: Theme.of(context).textTheme.subtitle1),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
