# 关于 Node.js&reg;

来源：[Node.js 官网](https://nodejs.org/en/about/)

Node 作为一种异步事件驱动的 JavaScript 运行时，被设计为建立扩展性好的网络应用程序。在下面的 "hello world" 样例中，可以同时处理大量连接。一旦监听到连接，就会执行回调函数，但是处于空闲情况，Node 就会睡眠。

[查看代码](./hello-world.js)

这和目前常见的基于系统线程的并发模型不同。基于线程的网络编程低效难用。另外，Node 用户无需担忧进程死锁，因为根本没有死锁。Node 的几乎所有函数都不直接操作 I/O，所以进程从来不会死锁。因为无锁，使用 Node 开发可扩展系统特别好。

如果以上没有解释清楚，可以参考这篇关于[阻塞和非阻塞](https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/)的文章。