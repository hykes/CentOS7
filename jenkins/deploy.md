# 自动部署

```
设置push以后自动构建，jenkins自动检测到并构建，

在"构建触发器"中选择"Build when a change is pushed to GitHub "和"Poll SCM "，这两项的作用分别是当GitHub有版本库更新时触发Jenkins进行构建和定期检查版本库是否有更新，如果有更新则触发Jenkins进行构建。
这里要注意Schedule语法，例如"*/2 * * * *"表示每隔2分钟检查一次。
```