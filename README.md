# ZHTableView

[![CI Status](https://img.shields.io/travis/xuzhenhao/ZHTableView.svg?style=flat)](https://travis-ci.org/xuzhenhao/ZHTableView)
[![Version](https://img.shields.io/cocoapods/v/ZHTableView.svg?style=flat)](https://cocoapods.org/pods/ZHTableView)
[![License](https://img.shields.io/cocoapods/l/ZHTableView.svg?style=flat)](https://cocoapods.org/pods/ZHTableView)
[![Platform](https://img.shields.io/cocoapods/p/ZHTableView.svg?style=flat)](https://cocoapods.org/pods/ZHTableView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZHTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZHTableView'
```

## 方案描述

## 总述
1. 传统的TableView是在一个又一个协议的驱动下构建的。一方面，每次我们都要重复的实现逻辑类似的协议，另一方面，业务逻辑不可避免的耦合到了numberOfRows,heightOfRow,cellForRow这些方法中，难以维护。
2. 本文方案的核心思想是抽象封装UITableView的数据源，通过构造特定的数据源来驱动TableView的创建。

## 问题引入

### 场景模拟
假如有一个类似网易云音乐首页的页面，根据UI图判断，从上到下分别有轮播图、今日热榜、流行音乐、为你推荐4个section。传统的思路，我们可能会为相应的section建立枚举，然后写出类似如下风格的代码。
```
switch(type){
case banner:
case hot:
....
}

```
这段代码至少会在数据源方法里出现3处，返回height时，返回rows时，返回cell时。但总之，我们确实实现了需求。

接着来到了第二版迭代，产品提出需求希望在banner下面加一个新栏目。此时，我们可能先在枚举里加新的值，然后在3个协议方法里插上新的代码。感觉到没有，后面每增删改一个模块，都需要这么修改，如果加上cell的事件回调，将是很庞大的一坨代码。

接着来到了最后一版，产品说我们又这么多模块了，干脆像网易云音乐一样，用户可以自己定制要显示哪些模块，而且这些模块位置可以自由排序。你会如何修改呢？

### 问题分析

上述问题的核心原因其实出在tableView的数据源上。传统思路中作为数据源的models都只是接口字段的映射，而tableView的数据源除了属性外，还需要知道height、reuserId等信息，这些合一起才是合格的tableview数据源对象。否则，这些信息就需要我们临时给出。比如在返回cell时，我们那一堆判断逻辑就是为了临时给出reuserId这个信息，然后结合Model组成完整的数据源信息。


## 方案设计

### 抽离数据源
分析后，其实我们的方案思路已经很清晰了，首先抽象出一个通用的cell对应的数据模型Item，Item包含了height、reuserId、data(对应json模型)等信息。之后，我们就可以从具体的controller中抽离tableView数据源了。

此时数据源逻辑是模板化的，numberOfrows的方法中返回items.count，cell的方法中从item取reuserId并返回cell.在这里，我们一般要根据model调方法更新cell的视图，这里我们怎么抽象出这个方法呢？可以通过协议抽象cell必须遵守的方法。

顺着这个思路完善下去，除了抽象row对应的模型外，我们还可以抽象section数据模型，一个sectionObject持有items可变数组，headerHeight,footerHeight等信息。一个customDataSource对象持有sections可变数组。最后，在具体的页面中，基本上就是下面的代码风格。
```
customDataSource.sections = sections;
self.tableView.dataSource = customDataSource;
```

构造tableView时，我们从关注各种代理方法变成了专注于数据，通过数据驱动UI逻辑。回到最初的场景，此时决定哪个音乐模块在哪个位置显示，仅仅取决于他在section数组中的索引。

### 基于响应链的事件传递

我们已经成功的抽离了数据源，还有一个问题就是原先耦合在cell中的回调事件如何处理。比如登录注册界面，我们往往需要从cell中往controller回调textDidBegan,textDidChanged等。现在cell的创建过程都已经抽离并且隐藏掉了，那这部分逻辑要如何实现呢？

方案是通过响应链来实现cell往controller的事件传递.cell会将事件从superView->controller-UIWindow的顺序逐级传递。我们在controller中实现相应方法就可以拦截到相应事件。 灵感来源于casa的[基于响应链的对象交互方式](https://casatwy.com/responder_chain_communication.html)。

## Author

xuzhenhao, 632476744@qq.com

## License

ZHTableView is available under the MIT license. See the LICENSE file for more info.
