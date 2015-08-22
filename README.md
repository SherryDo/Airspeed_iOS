# 目录

[注意事项](#zhiYiShiXiang)

[资源](#ziYuan)

[第三方库](#disanfang)

[git使用](#git)

<h1 id="zhiYiShiXiang">注意事项</h1>


1. Xcode7、swift2.0 (虽然现在还是测试版本，但是很快就发布正式版本了。所以我们使用这样的版本来开发，对以后有利)。
2. 用Github来做我们的代码管理，各自都要加入到Organizatin中来。尽快来测试一下，你是否能直接向代码库中提交代码。那么Git的基本使用也是必须要知道的。
Master分支主要用来发布正式的版本；develop分支用来开发。所以我们提交的时候提交到develop分支。
3. 使用Cocoapods来添加第三方库，所以你要知道Cocoapods的基本使用方法。并且安装它。
4. 在项目的文件里会以每个人的名字的缩写来创建文件夹，目的是为了使每个人的代码放在一个地方，方便管理。
5. 同时为了避免出现命名的冲突，我们在创建类的时候添加自己名字的缩写例如`Yxl_ViewController.swift`。或者是其他的，主要是为了避免冲突。
6. 因为使用故事版来开发界面的话不利于我们代码版本的控制。解决的办法，我们用多故事版开发。在iOS9中加强了对故事版的团队开发使用。可以去看一下WWDC2015关于这部分的介绍。[小波汉化的关于这部分的视屏](http://www.hcxy.me/course/43)。在视频中所用到的代码应该可以在Xcode7中的文档中找到。
7. 我们现在只去开发 iPhone设备的App，所以在项目中我们把`Use Size Classes`去掉，选则iPhone。但是不去掉`Use auto Layout`。这样的目的是为了简单省事！
8.  数据库我之后会和凯凯去设计一下。
10. 美工美女先了解下iOS下的图片都是怎么命名的（因为命名是有规则的），区分二倍图，三倍图是怎么回事。回头我会给你一些资料，快速入门一下。
11. 所有的一切就是要多沟通，虽然建立了一个讨论组可是觉得那样的交流并不好（有时会漏掉很多信息，原因就是大伙太活跃了）。建议发邮件或者是扣扣一对一的交流。除非是有必要大家一起交流的话，在讨论组里交流。
11. 我们会用到一些第三方的库，如果谁用了那些第三方库的话，请写在下边方便查看。

<h2 id="ziYuan">资源</h2>
(你有什么好的资源都可以写在这里)

1. [Swift2.0新特性](http://segmentfault.com/a/1190000002922232)

2. [讲解 Markdown](http://alfred-sun.github.io/blog/2015/01/10/markdown-syntax-documentation/)
3. [What's New in StoryBoards](http://www.hcxy.me/course/43)

4. [添加第三方库](http://www.cocoachina.com/industry/20140721/9201.html)

5. [Swift2中文翻译](http://wiki.jikexueyuan.com/project/swift/)

<h2 id = "disanfang">第三方库</h2>
1. 添加了第三方库`MJRefresh`;[链接](https://github.com/CoderMJLee/MJRefresh)上拉加载，下拉刷新。

2. 添加了第三方库`SwiftyJSON`;[链接](https://github.com/SwiftyJSON/SwiftyJSON)解析JOSN数据的.

3. 添加了第三方库`Pitaya`；[链接](https://github.com/johnlui/Pitaya)网络请求。文件的上传和下载等功能
4. 添加了第三方库`SwiftNotice`;[链接](https://github.com/johnlui/SwiftNotice)

<h2 id="git">git使用</h2>
我们现在都对远程仓库有读写的权限，所以可以直接提交到Github的远程仓库中。

把develop分支克隆到本地之后，我建议每次完成某个功能时再创建一个新的分支。

`git checkout -b newBranch`

之行上边这个命令就创建并且切换到了新的分支，名字叫做`newBranch`

你在这个分支多了很一些工作，完成了某个功能现在要往`develop`分支合并，首先切换到`develop`分支

`git checkout develop`

这个时候最好先和Github的服务器上的仓库同步一下，看看是否有人提交了新的更新。执行:

`git pull oringin develop`

然后看看输出结果是否有问题。没有问题的话再来合并`newBranch`分支。

`git merge --no-ff newBranch`

这个时候编译器会启动，用于录入合并提交的信息。默认信息中已经包含了一些默认的内容，可以不做修改。将编译器中显示的内容保存，关闭编辑器，然后就会看到一些输出结果。

然后把你本地的`develop`推送到Github上。

`git push `

然后你的`newBranch`分支就可以删掉，或者留着。


在Xcode中可以直接进行`commit`。这个就不多说了

8月22日：添加了一个对图片做各种编辑的类库。也就是通常的改变外形什么的。oc库，已桥接。库名：`UIImage+JYExtention`。文件夹：`Airspeed_iOS/renjie/UIImage+JYExtention` 暂无Github链接。。。。别人改好直接发给我的。
