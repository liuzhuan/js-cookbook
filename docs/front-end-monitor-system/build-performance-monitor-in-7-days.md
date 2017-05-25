# 7 天打造前端性能监控系统

http://fex.baidu.com/blog/2014/05/build-performance-monitor-in-7-days/

作者：zhangtao

日期：2014/05/11

为什么性能会影响公司的收益呢？根本原因还是在于性能影响了用户体验。加载的延迟、操作的卡顿等都会影响用户的使用体验。尤其是移动端，用户对页面响应延迟和连接中断的容忍度很低。想象一下你拿着手机打开一个网页想看到某个信息却加载半天的心情，你很可能选择直接离开换一个网页。谷歌也将页面加载速度作为 SEO 的一个权重，页面加载速度对用户体验和 SEO 的影响的调研有很多。

尽管性能很重要，开发迭代过程中难免会有所忽视，性能会伴随产品的迭代而有所衰减。特别在移动端，网络一直是一个很大的瓶颈，而页面却越来越大，功能越来越复杂。并没有简单的几条黄金规则就可以搞定性能优化工作，我们需要一套性能监控系统持续监控、评估、预警页面性能状况、发现瓶颈，指导优化工作的进行。

## Day2: 有什么可用的工具？

* [Page Speed](https://developers.google.com/speed/pagespeed/insights/)
* [YSlow](http://yslow.org/)
* [webpagetest](https://github.com/WPO-Foundation/webpagetest)