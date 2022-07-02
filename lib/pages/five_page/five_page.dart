import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/const_images.dart';

class FivePage extends StatefulWidget {
  static const String path = '/five_page';
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            stretch: true,
            snap: true,
            floating: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground, //rasmni zoom qiladi
                StretchMode.fadeTitle, //yozuvni yoq qiladi
                StretchMode.blurBackground //rasmga blur beradi
              ],
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                    ])),
                child: Image.asset(
                  MyImage.nature,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('flexible space bar'),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            for (var i = 0; i <= 20; i++)
              ListTile(
                leading: const FlutterLogo(),
                title: Text('text $i'),
              ),
          ])),
          SliverGrid.count(
            crossAxisCount: 3,
            children: [
              for (var i = 0; i <= 20; i++) const FlutterLogo(),
            ],
          ),

          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => const FlutterLogo(),
                  childCount: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2)),
          //oddiy box widgetlarini sliverga ogiradi
          SliverToBoxAdapter(
            child: Center(
                child: Container(
              color: Colors.red,
              height: 50,
              width: 50,
            )),
          ),
        ],
      )),
    );
  }
}
