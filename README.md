# qyxf-book：钱院学辅 LaTeX 书籍模板

`qyxf-book` 是由钱院学辅开发的、用于排版中等以上体量资料的 LaTeX 文类。目前，该模板已被用于编写了[《大学物理题解》](https://github.com/qyxf/university-physics)、《理论力学题解》、[《计算方法撷英》](https://qyxf.site/2019/11/26/notes-on-computing-methods-published)等诸多资料。

本份模板原在 [qyxf-sets 宏集](https://github.com/qyxf/qyxf-sets)项目中开发；因维护成本不高、效果不理想，现独立维护，并不再使用之前的 doc/doctrip 方式。采用 MIT 协议许可，请大家放心地 fork、修改。

> 本仓库中附有一份文档模板 `demo.tex`。请各位用户参考该文件编写文档，以获得最佳体验。

## 元信息定制

首页上的组织信息可由 `\org` 命令重定义，如默认的信息为：

```latex
\org{\textit{钱学森书院学业辅导中心}\\[1ex]\textsc{Xi'an Jiaotong University}}
```

你可以撰写相应信息，也可直接通过 `\org{}` 命令将该处清空。

封二上的许可证信息则可由 `\license` 定义，默认输出 CC BY-NC-ND 4.0 的相关信息。你可以自行撰写此部分内容，也可通过以下命令将许可证信息略去：

```latex
\license{}
```

## 预定义命令

本文类中已预定义下列命令：

- 练习命令：`\exersice{N}`，其将顶格生成一个形如「练习 N」的小块，用于标记练习题的序号。
- 解命令：`\solve`，顶格生成一个加粗的「解」字。
- 注记命令：`\note`，顶格生成加粗的「注记」字样。
- 分析命令：`\analysis`，顶格生成加粗的「分析」字样。

以上命令是在排版题解时设计的，目前来看并不被广泛应用，可能在未来版本中移除。

## 预定义定理环境

本文类中已预定以了下列定理环境：

- 定理 `theorem`
- 
