# APKAnalyserModules
##介绍
APKAnalyser是一个C++/Qt编写的APK行为分析和安全检测工具
这里是此工具的各个模块
##CSDN
这个项目的开发文档位于CSDN博客：http://blog.csdn.net/LeeHDsniper/article/category/6181339
##使用说明
- 每个模块的文件夹下有一个readme.txt文件，说明了模块功能和编译方法等
- 每个模块下都有一个test.cpp和test可执行文件用作测试

##模块使用顺序
1. MD5
2. APKDecompress
3. GetHardcodedCert
4. GetManifest
5. ManifestData
6. ManifestAnalysis
7. CertInfo
8. Decompile

##运行报错
由于我的java路径是直接作为函数参数传入的，所以在使用jar文件的模块中存在java路径的问题，可以直接在该模块的test.cpp中修改传入 的java路径，再重新编译
