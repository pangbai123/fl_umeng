### 友盟统计 for Flutter

## android

如果您的应用使用了代码混淆，请添加如下配置，以避免【友盟+】SDK被错误混淆导致SDK不可用。

android/app 目录 添加
```
   proguard-rules.pro

```
并在【proguard-rules.pro】 添加以下混淆内容
```groovy

-keep public class 您的应用包名.R$*{
   public static final int *;
}

```

android/app/build.gradle
添加以下内容
```groovy
  
buildTypes {
        release {
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
        debug {
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
}

```


## android 如遇到 Duplicate class com.google.common.util.concurrent.ListenableFuture的错误

```shell script
* What went wrong:
Execution failed for task ':app:checkDebugDuplicateClasses'.
> 1 exception was raised by workers:
  java.lang.RuntimeException: Duplicate class com.google.common.util.concurrent.ListenableFuture found in modules jetified-guava-20.0.jar (com.google.guava:guava:20.0) and jetified-listenablefuture-1.0.jar (com.google.guava:listenablefuture:1.0)

  Go to the documentation to learn how to <a href="d.android.com/r/tools/classpath-sync-errors">Fix dependency resolution errors</a>.
```

android/app/build.gradle 添加以下代码

```groovy

configurations {
    all*.exclude group: 'com.google.guava', module: 'listenablefuture'
}

```

## 开始使用

1.注册友盟

```dart

void main() {

  /// 注册友盟
  initWithUM(
      androidAppKey: '5f8fe2abfac90f1c19a8642e',
      iosAppKey: '5f8fe4d4c1122b44acfc7aa7',
      channel: 'channel');

  /// 是否开启log
  setUMLogEnabled(true);
  runApp(MaterialApp());
}

```

2.设置账号
```dart

    /// 设置用户账号

    signInWithUM('userID');


    /// 取消用户账号

    signOffWithUM();

```

3.发送自定义事件
```dart
    /// 发送自定义事件（目前属性值支持字符、整数、浮点、长整数，暂不支持NULL、布尔、MAP、数组）

     onEventWithUM();

```

4.使用页面统计
```dart

   /// 如果需要使用页面统计，则先打开该设置

   setPageCollectionModeManualWithUM();


   /// 如果不需要上述页面统计，在完成后可关闭该设置；如果没有用该功能可忽略；

   setPageCollectionModeAutoWithUM();


   /// 进入页面统计 

   onPageStartWithUM();

   /// 离开页面统计

   onPageEndWithUM();


```
5.
```dart
    /// 错误发送

    reportErrorWithUM();

```