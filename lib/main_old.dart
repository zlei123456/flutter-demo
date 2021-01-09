// import 'package:flame/game.dart';
// import 'package:flame/gestures.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flame/extensions/vector2.dart';
// import 'package:flame/sprite_animation.dart';
// import 'package:flame/components/sprite_animation_component.dart';
// import 'package:flutter/material.dart' hide Image;
// import 'dart:ui';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final game = MyGame();
//   runApp(
//     GameWidget(
//       game: game,
//     ),
//   );
// }

// class MyGame extends BaseGame with TapDetector {
//   Image chopper;
//   Image creature;
//   SpriteAnimation animation;

//   @override
//   Future<void> onLoad() async {
//     chopper = await images.load('chopper.png');
//     creature = await images.load('creature.png');

//     animation = SpriteAnimation.fromFrameData(
//       chopper,
//       SpriteAnimationData.sequenced(
//         amount: 4,
//         textureSize: Vector2.all(48),
//         stepTime: 0.15,
//         loop: true,
//       ),
//     );

//     final spriteSize = Vector2.all(100.0);
//     final animationComponent2 = SpriteAnimationComponent(spriteSize, animation);
//     animationComponent2.x = size.x / 2 - spriteSize.x;
//     animationComponent2.y = spriteSize.y;

//     final reversedAnimationComponent = SpriteAnimationComponent(
//       spriteSize,
//       animation.reversed(),
//     );
//     reversedAnimationComponent.x = size.x / 2;
//     reversedAnimationComponent.y = spriteSize.y;

//     add(animationComponent2);
//     add(reversedAnimationComponent);
//   }

//   void addAnimation(Vector2 position) {
//     final size = Vector2(291, 178);

//     final animationComponent = SpriteAnimationComponent.fromFrameData(
//       size,
//       creature,
//       SpriteAnimationData.sequenced(
//         amount: 18,
//         amountPerRow: 10,
//         textureSize: size,
//         stepTime: 0.15,
//         loop: false,
//       ),
//       removeOnFinish: true,
//     );

//     animationComponent.position = position;
//     animationComponent.position = animationComponent.position - size / 2;
//     add(animationComponent);
//   }

//   @override
//   void onTapDown(TapDownDetails evt) {
//     addAnimation(Vector2(evt.globalPosition.dx, evt.globalPosition.dy));
//   }
// }

import 'package:flame/anchor.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/position_component.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class Square extends PositionComponent with HasGameRef<MyGame> {
  Square(Vector2 position, Vector2 size, {double angle = 0}) {
    this.position.setFrom(position);
    this.size.setFrom(size);
    this.angle = angle;
  }
}

class ParentSquare extends Square {
  ParentSquare(Vector2 position, Vector2 size) : super(position, size);

  @override
  void onMount() {
    super.onMount();
    createChildren();
  }

  void createChildren() {
    // All positions here are in relation to the parent's position
    final children = [
      Square(Vector2(100, 100), Vector2(50, 50), angle: 3.15),
      // Square(Vector2(160, 100), Vector2(50, 50), angle: 3),
      // Square(Vector2(170, 150), Vector2(50, 50), angle: 4),
      // Square(Vector2(70, 200), Vector2(50, 50), angle: 5),
    ];

    children.forEach(addChild);
  }
}

class MyGame extends BaseGame {
  ParentSquare _parent;

  @override
  bool debugMode = true;

  MyGame() {
    _parent = ParentSquare(Vector2.all(200), Vector2.all(300));
    _parent.anchor = Anchor.center;
    // _parent.renderFlipX = true;
    add(_parent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // _parent.angle += dt;
  }
}
