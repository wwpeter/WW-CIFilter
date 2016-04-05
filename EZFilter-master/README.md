## EZFilter  

[![building](https://img.shields.io/badge/building-1.0.0-brightgreen.svg)](http://shields.io/)

#### EZFilter是什么?  

- 使用GPUImage封装几种滤镜效果, 滤镜可以组合使用. 
- EZFilter简单的封装了几种常用的滤镜, 之后会不断的更新.  

===  
  
##### EZInputPicture
  
- 输入的图片类  
  - 创建准备被渲染的图片 `initWithInput:output:`

===  
  
##### EZOutputView

- 输出的视图类  
  - 创建承载被渲染的试图容器 `initWithInput:output:`
  - 将试图容器添加到视图上  

===  
  
##### EZFilterManager

- 滤镜的管理类
  - 使用单个滤镜渲染图片的方法`processImageWithFilter: completionHandler:`
  - 使用多个滤镜渲染图片的方法`compositeFilters: completionHandler:`
