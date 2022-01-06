import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const riveFile = 'assets/loading2.riv';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  bool darkTheme = false;
  Artboard? _artboard;
  late RiveAnimationController _animationController;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    // final bytes = await rootBundle.load(riveFile);
    // RiveFile rFile = RiveFile.import(bytes);

    // setState(() => _artboard = rFile.mainArtboard
    //   ..addController(
    //     darkTheme
    //         ? _animationController = SimpleAnimation('dark')
    //         : _animationController = SimpleAnimation('light'),
    //   ));
    _animationController = darkTheme
        ? _animationController = SimpleAnimation('dark')
        : _animationController = SimpleAnimation('light');
  }

  void _onSucess() {
    if (_artboard != null) {
      _artboard!.artboard.removeController(_animationController);
      _artboard!.addController(darkTheme
          ? SimpleAnimation('dark_tick')
          : SimpleAnimation('light_tick'));
    }
  }

  void _onInit(Artboard artboard) {
    _artboard = artboard;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme ? null : Colors.blue,
      body: Center(
        child: RiveAnimation.asset(
          riveFile,
          onInit: _onInit,
          controllers: [_animationController],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _onSucess,
      ),
    );
  }
}
