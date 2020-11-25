# hello_world

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 运行配置

> 1.将flutter文件夹下F:\QMDownload\flutter\packages\flutter_tools\gradle的flutter.gradle做如下修改
>
> 第一段：

```groovy
buildscript {
    repositories {
        //修改此处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
    }
}
```

> 第二段

```groovy
class FlutterPlugin implements Plugin<Project> {
    // private static final String DEFAULT_MAVEN_HOST = "https://storage.googleapis.com";
    private static final String MAVEN_REPO = "https://storage.flutter-io.cn/download.flutter.io";//修改此处

    // The platforms that can be passed to the `--Ptarget-platform` flag.
    private static final String PLATFORM_ARM32  = "android-arm";
    private static final String PLATFORM_ARM64  = "android-arm64";
    private static final String PLATFORM_X86    = "android-x86";
    private static final String PLATFORM_X86_64 = "android-x64";

    // The ABI architectures.
    private static final String ARCH_ARM32      = "armeabi-v7a";
    private static final String ARCH_ARM64      = "arm64-v8a";
    private static final String ARCH_X86        = "x86";
    private static final String ARCH_X86_64     = "x86_64";
```

> 第三段

```groovy
void addFlutterDependencies(buildType) {
        String flutterBuildMode = buildModeFor(buildType)
        if (!supportsBuildMode(flutterBuildMode)) {
            return
        }
        String hostedRepository = System.env.FLUTTER_STORAGE_BASE_URL ?: DEFAULT_MAVEN_HOST
        String repository = useLocalEngine()
            ? project.property('local-engine-repo')
            : "$hostedRepository/download.flutter.io"
        project.rootProject.allprojects {
            repositories {
                maven {
                    url repository
                }
                //修改此处
                maven { url 'https://maven.aliyun.com/repository/google' }
                maven { url 'https://maven.aliyun.com/repository/jcenter' }
                maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
            }
        }
```

> 2.修改`Flutter`项目下的`android`下的`build.gradle`

```groovy
buildscript {
    ext.kotlin_version = '1.3.50'
    repositories {
        //修改此处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        //修改此处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}
```

> 修改后运行

```dart
flutter run
```

