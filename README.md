# JXMail

JXMail是一个邮件类的小组件，使用了MailCore2来进行邮件的各种功能。

## 如何添加MailCore2

**传送门**：[MailCore2](https://github.com/MailCore/mailcore2)

如何添加MailCore2，在MailCore2上已经讲的很详细了。这里就简单的介绍下如何将MailCore2嵌入项目中。

1. 终端输入 `git clone git@github.com:MailCore/mailcore2.git`
* 将`/mailcore2/build-mac/mailcore2.xcodeproj`拖拽到项目中
* 添加Frameword
	* CFNetwork.framework
	* Security.framework
	* libMailCore-ios.a
* 设置Build Settings
	* 清空**Library Search Paths**
	* **C++ Standard Library**设置为`libc++`
	* **Other Linker Flags**设置为`-lctemplate-ios -letpan-ios -licudata -licui18n -licuuc -lxml2 -lsasl2 -liconv -ltidy -lz -licucore -lc++ -stdlib=libc++ -ObjC`
* **Target Dependencies** 添加`static mailcore2 ios(mailcore2)`

**注意：**上述操作完成，即表示设置完毕。由于MailCore2的添加设置会随着更新而不断变化，因此如果上述方式Build失败，可以去MailCore2查看最新的编辑配置方法

## 如何使用JXMail




## Contact
**Email:** andy_ios@163.com


##Licenses

All source code is licensed under the [MIT License](https://github.com/andy0323/JXRegular/blob/master/LICENSE).

