# Flutter组件参数

## Container组件（容器）

### alignment：对齐方式

> topCenter：顶部居中对齐
> topLeft：顶部左对齐
> topRight：顶部右对齐
> center：水平垂直居中对齐
> centerLeft：垂直居中水平居左对齐
> centerRight：垂直居中水平居右对齐
> bottomCenter 底部居中对齐
> bottomLeft：底部居左对齐
> bottomRight：底部居右对齐

### decoration：边框

```dart
decoration: BoxDecoration(
    color: Colors.blue,
    border: Border.all(
    color: Colors.red,
    width: 2.0,
),
borderRadius:BorderRadius.all(
    Radius.circular(8.0)
  )
)
```

### margin：外边距

> margin 属性是表示Container 与外部其他组件的距离。
> EdgeInsets.all(20.0),

### padding：内边距

> padding 就是Container 的内边距， 指
> Container 边缘与Child 之间的距离
> padding: EdgeInsets.all(10.0)

### transform：旋转

> transform: Matrix4.rotationZ(0.2)

### height：高度

> height：100.0

### width：宽度

> width：100.0

### child：子元素

> child：Container()

## Text组件（文本）

### textAlign：对齐方式

> 文本对齐方式（center 居中，left 左对齐，right 右对齐，justfy 两端对齐）

### textDirection：文本方向

> 文本方向（ltr 从左至右，rtl 从右至左）

### overflow：文本超出

> 文字超出屏幕之后的处理方式（clip裁剪，fade 渐隐，ellipsis 省略号）

### textScaleFactor：放大缩小

> 字体显示倍率

### maxLines：最大行数

> 文字显示最大行数

### style：字体样式

> style：TextStyle()

#### TextStyle：字体样式类

##### decoration：文字装饰线

> 文字装饰线（none 没有线，lineThrough 删除线，overline 上划线，underline 下划线）

##### decorationColor：装饰线颜色

##### decorationStyle：装饰线风格

> 文字装饰线风格（[dashed,dotted]虚线，double 两根线，solid 一根实线，wavy 波浪线）

##### wordSpacing：单词间隙

> 单词间隙（如果是负值，会让单词变得更紧凑）

##### letterSpacing：字母间隙

> 字母间隙（如果是负值，会让字母变得更紧凑）

##### fontStyle：文字样式

> 文字样式（italic 斜体，normal 正常体）

##### fontSize：字体大小

##### color：字体颜色

##### fontWeight：字体粗细

> 字体粗细（bold 粗体，normal 正常体）

## Image组件（图片）

使用方法：Image.asset() 本地图片

​                   Image.network() 远程图片

### alignment：对齐方式

> alignment：Alignment()

### color 和 colorBlendMode：图片颜色

> 设置图片的背景颜色，通常和 colorBlendMode 配合一起 使用，这样可以是图片颜色和背景色混合。上面的图片就 是进行了颜色的混合，绿色背景和图片红色的混合

### fit：拉伸和挤压

> fit 属性用来控制图片的拉伸和挤压，这都是根据父容器来 的。
>
> BoxFit.fill:全图显示，图片会被拉伸，并充满父容器。 
>
> BoxFit.contain:全图显示，显示原比例，可能会有空隙。 
>
> BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）。
>
> BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸， 可能裁切。 
>
> BoxFit.fitHeight ：高度充满（竖向充满）,显示可能拉 伸，可能裁切。 
>
> BoxFit.scaleDown：效果和 contain 差不多，但是此属 性不允许显示超过源图片大小，可小不可大。

### repeat：平铺

> ImageRepeat.repeat : 横向和纵向都进行重复，直到铺满整个画布。 
>
> ImageRepeat.repeatX: 横向重复，纵向不重复。 
>
> ImageRepeat.repeatY：纵向重复，横向不重复。

### width和height：宽和高

> 一般结合 ClipOval 才能看到效果

```dart
class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
          "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg",
          alignment: Alignment.topLeft,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge, // repeat: ImageRepeat.repeatX,
          fit: BoxFit.cover,
        ),
        width: 300.0,
        height: 400.0,
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    );
  }
}
```

### 引用本地图片

> 新建文件夹放置图片，然后，打开 pubspec.yaml 声明一下添加的图片文件，**注意要配置对**

```dart
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  assets:
    - images/a.jpg
```

> 最后，在代码中就可以用了

```dart
class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset("images/a.jpeg", fit: BoxFit.cover),
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    );
  }
}
```

### 圆形图片

> 使用ClipOval()包裹Image

```dart
class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ClipOval(
        child: Image.network(
          "https://www.itying.com/images/201905/ thumb_img/1101_thumb_G_1557845381862.jpg",
          width: 150.0,
          height: 150.0,
        ),
      )),
    );
  }
}
```

## ListView组件（列表组件）

### scrollDirection：列表形式

> scrollDirection：Axis.horizontal 水平列表  ；  Axis.vertical 垂直列表；

### padding：内边距

> padding：EdgeInsetsGeometry.all()

### reverse：组件滚动方向

> 滚动方向如果是垂直方向，默认是向上滚动，通过`reverse`参数设置其向下滚动

### children：列表元素

> children：<Widget>[ ]

### 基本列表

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Center(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              "this is list",
              style: TextStyle(fontSize: 28.0),
            ),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            title: Text("this is list"),
            subtitle: Text('this is list this is list'),
            trailing: Icon(Icons.phone),
          ),
          ListTile(
            title: Text("this is list"),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            title: Text("this is list"),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            title: Text("this is list"),
            subtitle: Text('this is list this is list'),
          )
        ],
      ),
    );
  }
}
```

### 动态列表

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}

class HomeContent extends StatelessWidget {
  List list = new List();
  HomeContent({Key key}) : super(key: key) {
    for (var i = 0; i < 20; i++) {
      list.add("这是第${i}条数据");
    }
    print(list);
  }
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return ListView.builder
        ength,
      itemBuilder: (context, index) {
// print(context);
        return ListTile(
          leading: Icon(Icons.phone),
          title: Text("${list[index]}"),
        );
      },
    );
  }
}
```

## GridView：网格列表组件

> 使用方法：GridView.count；GridView.builder；

### scrollDirection：滚动方法

> scrollDirection：Axis.horizontal 水平列表  ；  Axis.vertical 垂直列表；

### padding：内边距

> padding：EdgeInsetsGeometry.all()

### resolve：组件反向排序

> resolve：bool；

### crossAxisSpacing：水平子Widget 之间间距

> crossAxisSpacing：10.0

### mainAxisSpacing：垂直子Widget 之间间距

> mainAxisSpacing：10.0

### crossAxisCount：一行的Widget 数量

> crossAxisCount：10

### childAspectRatio：子Widget 宽高比例

> childAspectRatio：10.0

### children：子组件

> children：<Widget>[ ]

### gridDelegate：控制布局主要用在GridView.builder 里面

> gridDelegate：SliverGridDelegateWithFixedCrossAxisCount（常用）SliverGridDelegateWithMaxCrossAxisExtent

### GridView.count实现普通网格布局

```dart
class LayoutContent extends StatelessWidget {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 12),
            Text(value["title"],
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(230, 230, 230, 0.9), width: 1.0)),
      );
    });
// ('124124','124214')
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
// childAspectRatio:0.7,
      children: this._getListData(),
    );
  }
}
```

### GridView.builder实现普通网格布局

```dart
class LayoutContent extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(height: 12),
          Text(listData[index]["title"],
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(230, 230, 230, 0.9), width: 1.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return GridView.builder(
      itemCount: listData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//横轴元素个数
          crossAxisCount: 2,
//纵轴间距
          mainAxisSpacing: 20.0,
//横轴间距
          crossAxisSpacing: 10.0,
//子组件宽高长度比例
          childAspectRatio: 1.0),
      itemBuilder: this._getListData,
    );
  }
}
```

## Padding组件：处理容器与子元素直接的间距

### padding：padding 值, EdgeInsetss 设置填充的值

### child：子组件

> 使用方法：

```dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/1.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/2.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/3.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/4.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/5.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network('https://www.itying.com/images/flutter/6.png',
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
```

## Row(Column)：水平(垂直)布局组件

### mainAxisAlignment：主轴的排序方式 ；

> mainAxisAlignment: MainAxisAlignment.spaceEvenly,
>
> spacEvenly：将主轴空白区域均分，使各个子控件间距相等；
>
> start：将子控件放在主轴的开始位置；
>
> end：将子控件放在主轴的结束位置；
>
> center：将子控件放在主轴的中间位置；
>
> spaceBetween：将主轴空白位置进行均分，排列子元素，手尾没有空隙；
>
> spaceAround：将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半；

### crossAxisAlignment：次轴的排序方式 ；

> crossAxisAlignment: CrossAxisAlignment.center,
>
> start：将子控件放在交叉轴的起始位置；
>
> end：将子控件放在交叉轴的结束位置；
>
> center：将子控件放在交叉轴的中间位置；
>
> stretch：使子控件填满交叉轴；
>
> baseline：将子控件放在交叉轴的上，并且与基线相匹配（不常用）；

### children：组件子元素；

> 使用方法：

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 500,
      color: Colors.black26,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(Icons.home, color: Colors.red),
          IconContainer(Icons.search, color: Colors.blue),
          IconContainer(Icons.send, color: Colors.orange),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size;
  IconData icon;
  Color color;
  IconContainer(this.icon, {this.size, this.color = Colors.blue}) {
    this.size = 32.0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: this.size + 60,
        height: this.size + 60,
        color: this.color,
        child: Center(
            child: Icon(this.icon, color: Colors.white, size: this.size)));
  }
}

```

## Expanded：类似web中的flex布局

> Expanded 可以用在 Row 和 Column 布局中

> 属性：

### flex：元素站整个父 Row /Column 的比例 

> Expanded(flex:2,child: IconContainer(Icons.home)),

### child：子元素

```dart
import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 2, child: IconContainer(Icons.home)),
          SizedBox(width: 10),
          Expanded(flex: 3, child: IconContainer(Icons.search)),
          SizedBox(width: 10),
          Expanded(child: IconContainer(Icons.send))
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size;
  IconData icon;
  IconContainer(this.icon, {this.size}) {
    this.size = 32.0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blue,
        child: Center(
            child: Icon(this.icon, color: Colors.white, size: this.size)));
  }
}

```

## Stack：Stack 表示堆的意思

> 可以用 Stack 或者 Stack 结合 Align 或者 Stack 结合 Positiond 来实现页面的定位布局 ；

> alignment ：指的是子Widget的对其方式，默认情况是以左上角为开始点 ，区分为使用了Positioned和未使用Positioned定义两种情况；
>
> fit ：用来决定没有Positioned方式时候子Widget的大小；StackFit.loose 指的是子Widget 多大就多大，StackFit.expand使子Widget的大小和父组件一样大；
>
> overflow：指子Widget 超出Stack时候如何显示；默认值是Overflow.clip，子Widget超出Stack会被截断，
>
> Overflow.visible超出部分还会显示的。

```dart
import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stack title"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 90,
            height: 90,
            color: Colors.blue,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

}
```

## Positioned：控制Widget的位置，可以随意摆放一个组件

> left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离

```dart
class PositionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postion Title"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100.0,
            child: Container(
              color: Colors.blue,
              child: Text("第一个组件"),
            ),
          ),
          Positioned(
            top: 200,
            right: 100,
            child: Container(
              color: Colors.yellow,
              child: Text("第二个组件"),
            ),
          ),
          Positioned(
            left: 100.0,
            child: Container(
              color: Colors.red,
              child: Text("第三个组件"),
            ),
          ),
        ],
      ),
    );
  }
}
```

### alignment 属性理解

#### 没有使用Positioned定位情况：

> AlignmentDirectional.bottomEnd：所有的Widget 以Stack的右下角为起点开始对齐；
>
> AlignmentDirectional.topEnd：所有的Widget 以Stack的右上角为起点开始对齐；
>
> AlignmentDirectional.center：所有的Widget 以Stack的中心位置；
>
> AlignmentDirectional.centerEnd：所有的Widget 在Stack的中心位置并且右边跟stack右边挨着；

#### 使用Positioned情况下：

> Positioned  有四个属性top、bottom、left、right，（top、bottom）决定了垂直方向上的位置了，（left、right）决定了水平方向上的位置，不管水平方向上还是垂直方向上只要设定了一个值该方向上位置就已经确定过了，aligment对这这个方向上就不会起作用了，如果Positioned 设置了其中任意三个方向的值，这个Widget的位置就是固定的，aligment对它不会起任何作用。

## AspectRatio：根据设置调整子元素 child 的宽高比

> aspectRatio：宽高比，最终可能不会根据这个值去布局，具体则要看综合因素，外层是否允许按照这种比率进行布局，这只是一个参考值。

```dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 200,
        child: AspectRatio(
          aspectRatio: 2.0 / 1.0,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
```

## Card：卡片组件

> margin：外边距；
>
> child：子组件；
>
> Shape：Card 的阴影效果，默认的阴影效果为圆角的长方形边。

```dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("张三", style: TextStyle(fontSize: 28)),
                subtitle: Text("高级软件工程师"),
              ),
              Divider(),
              ListTile(
                title: Text("电话：1213214142"),
                  
              ),
              ListTile(title: Text("地址：北京市海淀区"))
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("李四", style: TextStyle(fontSize: 28)),
                subtitle: Text("高级软件工程师"),
              ),
              Divider(),
              ListTile(
                title: Text("电话：1213214142"),
              ),
              ListTile(title: Text("地址：北京市海淀区"))
            ],
          ),
        )
      ],
    );
  }
}
```

## Wrap：可实现流布局

> 单行的 Wrap 跟 Row 表现几乎一致，单列的 Wrap 则跟 Row 表现几乎一致。但 Row 与 Column 都是单行单列的，Wrap 则突破了这个限制，mainAxis 上空间不足时，则向 crossAxis 上去扩展显示。

### direction：主轴的方向，默认水平

> direction：Axis.horizontal //水平方向；
>
> direction：Axis.vertical  //垂直方向；

### alignment：主轴的对其方式

> WrapAlignment.spacEvenly：将主轴空白区域均分，使各个子控件间距相等；
>
> WrapAlignment.start：将子控件放在主轴的开始位置；
>
> WrapAlignment.end：将子控件放在主轴的结束位置；
>
> WrapAlignment.center：将子控件放在主轴的中间位置；
>
> WrapAlignment.spaceBetween：将主轴空白位置进行均分，排列子元素，手尾没有空隙；
>
> WrapAlignment.spaceAround：将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半；

### spacing：主轴方向上的间距

### runAlignment：子控件在交叉轴上的对齐方式

> WrapAlignment.spacEvenly：将主轴空白区域均分，使各个子控件间距相等；
>
> WrapAlignment.start：将子控件放在主轴的开始位置；
>
> WrapAlignment.end：将子控件放在主轴的结束位置；
>
> WrapAlignment.center：将子控件放在主轴的中间位置；
>
> WrapAlignment.spaceBetween：将主轴空白位置进行均分，排列子元素，手尾没有空隙；
>
> WrapAlignment.spaceAround：将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半；

### runSpacing ：交叉轴上子控件之间的间距

### crossAxisAlignment：交叉轴上子控件的对齐方式

> WrapAlignment.spacEvenly：将主轴空白区域均分，使各个子控件间距相等；
>
> WrapAlignment.start：将子控件放在主轴的开始位置；
>
> WrapAlignment.end：将子控件放在主轴的结束位置；
>
> WrapAlignment.center：将子控件放在主轴的中间位置；
>
> WrapAlignment.spaceBetween：将主轴空白位置进行均分，排列子元素，手尾没有空隙；
>
> WrapAlignment.spaceAround：将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半；

### textDirection：文本方向

### verticalDirection：垂直方向上子控件的其实位置

> VerticalDirection.up：上;
>
> VerticalDirection.down：下;

## RaisedButton：按钮组件（可改变状态）

> onPressed: onPressed,
>
> onLongPress: onLongPress,
>
> onHighlightChanged: onHighlightChanged,
>
>  mouseCursor: mouseCursor,
>
>  textTheme: textTheme,
>
>  textColor: textColor,
>
> ​     disabledTextColor: disabledTextColor,
>
> ​     color: color,
>
> ​     disabledColor: disabledColor,
>
> ​     focusColor: focusColor,
>
> ​     hoverColor: hoverColor,
>
> ​     highlightColor: highlightColor,
>
> ​     splashColor: splashColor,
>
> ​     colorBrightness: colorBrightness,
>
> ​     elevation: elevation,
>
> ​     focusElevation: focusElevation,
>
> ​     hoverElevation: hoverElevation,
>
> ​     highlightElevation: highlightElevation,
>
> ​     disabledElevation: disabledElevation,
>
> ​     padding: padding,
>
> ​     visualDensity: visualDensity,
>
> ​     shape: shape,
>
> ​     clipBehavior: clipBehavior,
>
> ​     focusNode: focusNode,
>
> ​     autofocus: autofocus,
>
> ​     materialTapTargetSize: materialTapTargetSize,
>
> ​     animationDuration: animationDuration,
>
> ​     child: child,

## StatelessWidget和StatefulWidget

> StatelessWidget是无状态组件，状态不可变的 widget；
>
> StatefulWidget是有状态组件，持有的状态可能在 widget 生命周期改变。通俗的讲：如果我们想改变页面中的数据的话这个时候就需要用到StatefulWidget

> 使用方法：

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('有状态的组件')),
      body: HomePage(),
    ));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Chip(label: Text("${this.count}")),
        RaisedButton(
          child: Text('增加'),
          onPressed: () {
            print(this.count);
            setState(() {
              this.count++;
            });
          },
        )
      ],
    ));
  }
}

```

## BottomNavigationBar：底部导航栏

> bottomNavigationBar是 Scaffold 组件的参数。BottomNavigationBar使用需要配合Scaffold组件

> items：List<BottomNavigationBarItem> 底部导航条按钮集合；
>
> iconSize：图标尺寸；
>
> currentIndex：默认选中第几个；
>
> onTap：选中的回调函数；
>
> fixedColor：选中的颜色；
>
> type：导航栏模式，一般用BottomNavigationBarType.fixed，BottomNavigationBarType.shifting太花里胡哨；

```dart
bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 36.0, //icon的大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置"))
        ],
      ),
```

## AppBar：顶端栏组件

> leading：在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮。
>
> title：主要内容，通常显示为当前界面的标题文字。
>
> actions：List - 一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单。
>
> bottom：一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏。
>
> elevation：控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值。
>
> flexibleSpace：一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用。
>
> brightness：Appbar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness。
>
> iconTheme：Appbar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData.primaryIconTheme。
>
> textTheme：Appbar 上的文字样式。
>
> centerTitle：标题是否居中显示，默认值根据不同的操作系统，显示方式不一样。

```dart
import 'package:flutter/material.dart';

class AppBardemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Search",
            onPressed: () {
              print('menu Pressed');
            }),
        title: Text('FlutterDemo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: "more_horiz",
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: Text('这是 Appbar'),
    );
  }
}

```

## TabBar：tab导航栏

> tabs：显示的标签内容，一般使用 Tab 对象,也可以是其他的 Widget；
>
> controller：TabController对象；
>
> isScrollable：是否可滚动；
>
> indicatorColor：指示器颜色；
>
> indicatorWeight：指示器高度；
>
> indicatorPadding：底部指示器的 Padding；
>
> indicator：指示器 decoration，例如边框等；
>
> indicatorSize：指示器大小计算方式，TabBarIndicatorSize.label 跟文字等宽,TabBarIndicatorSize.tab 跟每个 tab 等宽；
>
> labelColor：选中 label 颜色；
>
> labelStyle：选中 label 的 Style；
>
> labelPadding：每个 label 的 padding 值；
>
> unselectedLabelColor：未选中 label 颜色；
>
> unselectedLabelStyle：未选中 label 的 Style ；

### TabController对象

> 默认方式的TabController

```dart
默认方式的TabController
// 继承SingleTickerProviderStateMixin，提供单个Ticker（每个动画帧调用它的回调一次）
class Widget_TabBar_Default_State_Page extends State<Widget_TabBar_Default_Page>
    with SingleTickerProviderStateMixin {

  TabController controller;
  var tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(text: "Tab1",),
      Tab(text: "Tab2",),
      Tab(text: "Tab3",),
      Tab(text: "Tab4",),
      Tab(text: "Tab5",),
      Tab(text: "Tab6",),
      Tab(text: "Tab7",),
      Tab(text: "Tab8",),
      Tab(
        text: "Tab9",
        icon: Icon(Icons.phone),
      ),
    ];

    //initialIndex初始选中第几个
    controller =
        TabController(initialIndex: 3, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: TabBar(
              controller: controller,//可以和TabBarView使用同一个TabController
              tabs: tabs,
              isScrollable: true,
              indicatorColor: Color(0xffff0000),
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(bottom: 10.0),
              labelPadding: EdgeInsets.only(left: 20),
              labelColor: Color(0xff333333),
              labelStyle: TextStyle(
                fontSize: 15.0,
              ),
              unselectedLabelColor: Color(0xffffffff),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          body: TabBarView(
              controller: controller,
              children: tabs
                  .map((Tab tab) =>
                  Container(child: Center(child: Text(tab.text),),))
                  .toList()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

```

> 自定义方式的TabController

```dart
自定义方式的TabController

class Widget_TabBar_Userdefined_State_Page
    extends State<Widget_TabBar_Userdefined_Page>
    with SingleTickerProviderStateMixin {

  var controller;
  var tabs = <Tab>[
    Tab(text: "Tab1",),
    Tab(text: "Tab2",),
    Tab(text: "Tab3",),
    Tab(text: "Tab4",),
    Tab(text: "Tab5",),
    Tab(text: "Tab6",),
    Tab(text: "Tab7",),
    Tab(text: "Tab8",),
    Tab(
      text: "Tab9",
      icon: Icon(Icons.phone),
    ),
  ];

  @override
  void initState() {
    controller = TabController(
      length: tabs.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: tabs,
            controller: controller,
            //配置控制器
            isScrollable: true,
            indicatorColor: Color(0xffff0000),
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(bottom: 10.0),
            labelPadding: EdgeInsets.only(left: 20),
            labelColor: Color(0xff333333),
            labelStyle: TextStyle(
              fontSize: 15.0,
            ),
            unselectedLabelColor: Color(0xffffffff),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
        body: TabBarView(
            controller: controller, //配置控制器
            children: tabs
                .map((Tab tab) =>
                Container(child: Center(child: Text(tab.text),),))
                .toList()),
      ),
    );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
```

## Drawer：侧边栏

在 Scaffold 组件里面传入 drawer 参数可以定义左侧边栏，传入 endDrawer 可以定义右侧边 栏。侧边栏默认是隐藏的，我们可以通过手指滑动显示侧边栏，也可以通过点击按钮显示侧 边栏。

```dart
return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      drawer: Drawer(
        child: Text('左侧边栏'),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
```

### DrawerHeader：侧边栏头部

> decoration：设置顶部背景颜色；
>
> child：配置子元素；
>
> padding：内边距；
>
> margin：外边距；

```dart
DrawerHeader( decoration: BoxDecoration( color: Colors.yellow, image:DecorationImage( image: NetworkImage("https://www.itying.com/images/flutter/2.png"), fit:BoxFit.cover ) ),
```

### UserAccountsDrawerHeader：用户信息头部

> decoration：设置顶部背景颜色；
>
> accountName：账户名称；
>
> accountEmail：账户邮箱；
>
> currentAccountPicture：用户头像；
>
> otherAccountsPictures：用来设置当前账户其他账户头像；

```dart
Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("飞花逐蝶"),
                  accountEmail: Text("2357818482@qq.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/3.png"),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover,
                  )),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        "https://www.itying.com/images/flutter/4.png"),
                    Image.network(
                        "https://www.itying.com/images/flutter/5.png"),
                  ],
                ))
```

## 按钮组件

> **RaisedButton** ：凸起的按钮，其实就是 Material Design 风格的 Button ；
>
> **FlatButton** ：扁平化的按钮 ；
>
> **OutlineButton**：线框按钮 ；
>
> **IconButton** ：图标按钮 ；
>
> **ButtonBar**:按钮组 
>
> **FloatingActionButton:**浮动按钮；

## TextField：文本框组件

> maxLines：设置此参数可以把文本框改为多行文本框；
>
> onChanged：文本框改变的时候触发的事件；
>
> decoration：**hintText** 类似 html 中的 placeholder 
>
> ​                       **border** 配置文本框边框 OutlineInputBorder 配合使用 
>
> ​                       **labelText** lable 的名称 
>
> ​                       **labelStyle** 配置 lable 的样式
>
> obscureText：把文本框框改为密码框；
>
> controller：**controller** 结合 TextEditingController()可以配置表单默认显示的内容

## Checkbox、CheckboxListTile：多选框组件

### Checkbox

> value：true 或者 false；
>
> onChanged：改变的时候触发的事件；
>
> activeColor：选中的颜色、背景颜色；
>
> checkColor：选中的颜色、Checkbox 里面对号的颜色；

### CheckboxListTile

> value：true 或者 false；
>
> onChanged：改变的时候触发的事件；
>
> activeColor：选中的颜色、背景颜色；
>
> title：标题；
>
> subtitle：二级标题；
>
> secondary：配置图标或者图片；
>
> selected：选中的时候文字颜色是否跟着改变；

## Radio、RadioListTile 单选按钮组件

### Radio

> value：true 或者 false；
>
> onChanged：改变的时候触发的事件；
>
> activeColor：选中的颜色、背景颜色；
>
> groupValue：选择组的值；

### RadioListTile

> value：true 或者 false；
>
> onChanged：改变的时候触发的事件；
>
> activeColor：选中的颜色、背景颜色；
>
> title：标题；
>
> subtitle：二级标题；
>
> secondary：配置图标或者图片；
>
> groupValue：选择组的值；

## Switch：开关组件

> value：true 或者 false；
>
> onChanged：改变的时候触发的事件；
>
> activeColor：选中的颜色、背景颜色；

## 路由

### 初始化路由

```dart
MaterialApp( 
    // home:Tabs(), 
    initialRoute: '/', 
    routes: { 
      '/':(contxt)=>Tabs(), 
      '/search':(contxt) =>SearchPage(), 
      '/form': (context) => FormPage(), 
    }, 
);
```

### 路由跳转

```dart
Navigator.pushNamed(context, '/search');
```

### 跳转传值

```dart
final routes = {
     '/': (contxt) => Tabs(), 
     '/search': (contxt) => SearchPage(), 
     '/form': (context, {arguments}) => FormPage(arguments: arguments), 
};
```

```dart
Navigator.pushNamed(context, '/form',arguments: { "id":20 });
```

### 接收参数

```dart
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final Map arguments;
  FormPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("搜索"),
        ),
        body: Text("我是一个表单页面 ${arguments != null ? arguments['id'] : '0'}"));
  }
}
```

### 集中处理路由

```dart
import 'package:flutter/material.dart';

import '../pages/Tabs.dart';

import '../pages/Button.dart';

import '../pages/TextField.dart';

import '../pages/CheckBox.dart';

import '../pages/Radio.dart';

import '../pages/FormDemo.dart';

//配置路由
final routes={
      '/':(context)=>Tabs(),
      '/buttonPage':(context)=>ButtonDemoPage(),
      '/textField':(context)=>TextFieldDemoPage(),
      '/checkBox':(context)=>CheckBoxDemo(),
      '/radio':(context)=>RadioDemo(),
       '/form':(context)=>FormDemoPage(),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};
```

> main.dart引入并初始化

```dart
import 'package:flutter/material.dart';



import 'routes/Routes.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,  //去掉debug图标
      // home:Tabs(),   
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}
```

### 返回上一级

```dart
Navigator.of(context).pop();
```

### 替换路由

> 比如我们从用户中心页面跳转到了 registerFirst 页面，然后从 registerFirst 页面通过 pushReplacementNamed 跳转到了 registerSecond 页面。这个时候当我们点击 registerSecond的返回按钮的时候它会直接返回到用户中心。

```dart
Navigator.of(context).pushReplacementNamed('/registerSecond');
```

### 返回根路由

```dart
Navigator.of(context).pushAndRemoveUntil( 
                          new MaterialPageRoute(builder: (context) => new Tabs(index:1)), 
                          (route) => route == null 
);
```

