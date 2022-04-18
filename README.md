# 前言
轻量级 Vim 配置框架，全中文注释，这既是一份合理的轻量级配置，更是一份简明教程。话说，网上的 Vim 配置多的数不过来，这里又做一个干嘛？这些配置都有一些问题：

- 注释不够，很多配置就是劈里啪啦一堆 VimScript 看的人一头雾水，新人顶多只能 “用”，没法跟着 “学”。
- 大部分都是针对 Vim 7 以前的版本，太过陈旧，对 8.0/8.1 以后的各种现代编辑器特征支持不足。
- 模块化不够好，全部塞在一个几百行的 `vimrc` 文件里，各部分搅在一起，增改都比较麻烦。
- 插件没有分组，不能根据需要灵活选择功能组，所有插件一上就全上了，要禁止就是进去注释代码。
- 它们有很多错误的地方，比如中文编码都没设对，很多 Windows 下的 PowerShell 脚本都打开不了。
- 错误的习惯，比如把 jk 映射成 ESC 的，顺着从 a 打倒 z 都打不流畅，输入个 `Dijkstra` 都输入不了。
- 对 C/C++ 开发支持不足。

还有不少插件自己给设置门槛的，比如把方向键禁用掉，我见过很多才用 Vim 的新人，大部分都呆在插入模式下，保存文件才会退出一下，至少人家开始用了，等到熟练了，该用 hjkl 的时候自然会去用。你这上来就把方向键和鼠标禁止了，除了阻挡新人外，我不知道有什么作用。

总之，山寨居多，还有某些著名的广为流传的 Vim 配置，我都不想点名了，把 Leader 键映射成逗号了，它不知道逗号/分号在 Vim 里是用来定位 f/t 搜索的下一个/上一个结果的么？就和 n/N 定位斜杠搜索一样。把 Leader 定义成空格我都还觉得挺科学，定义成逗号和分号的这些配置，是在把错误的用法源源不断的交给未来的新用户。

所以网上缺一份合理的轻量级配置，适合新人学习那种，于是有了这个项目。


# 安装

将项目克隆到你喜欢的目录内，比如 `~/.vim` 内：

```bash
cd ~/.vim
git clone https://github.com/skywind3000/vim-init.git
```

然后创建你的 `~/.vimrc` 文件，里面只有一句话：

```VimL
source ~/.vim/vim-init/init.vim
```

请调整你的终端软件，确保对 ALT 键的支持，以及 Backspace 键发送正确扫描码：

[终端软件下正确支持 ALT 键和 Backspace 键](https://github.com/skywind3000/vim-init/wiki/Setup-terminals-to-support-ALT-and-Backspace-correctly)

然后启动 Vim，在命令行运行 `:PlugInstall` 安装依赖插件即可。

# 结构

本配置按顺序，由如下几个主要模块组成：

- `init.vim`: 配置入口，设置 runtimepath 检测脚本路径，加载其他脚本。
- `init-basic.vim`: 所有人都能同意的基础配置，去除任何按键和样式定义，保证能用于 `tiny` 模式（没有 `+eval`）。
- `init-config.vim`: 支持 +eval 的非 tiny 配置，初始化 ALT 键支持，功能键键盘码，备份，终端兼容等
- `init-tabsize.vim`: 制表符宽度，是否展开空格等，因为个人差异太大，单独一个文件好更改。
- `init-plugin.vim`: 插件，使用 vim-plug，按照设定的插件分组进行配置。
- `init-style.vim`: 色彩主题，高亮优化，状态栏，更紧凑的标签栏文字等和显示相关的东西。
- `init-keymaps.vim`: 快捷键定义。

最好 fork 一份到你自己的仓库，然后不断修改，把它修改成你自己的东西，平时要更新时到这里同步下上游仓库，然后自己合并一下即可。

除去 vim-plug 额外安装的插件外，本配置自带一些依赖较大的[插件](https://github.com/skywind3000/vim-init/wiki/Integrated-Plugins)，保证内网连不了网的情况下，把本配置压缩包解压一下就能跑得起来，且基本功能可用，它们都比较简单，往往一两个文件，分布于 `plugin` 和 `autoload` 两个目录中，你可以根据自己需要增改。

# 帮助

既然是全中文注释，帮助主要看 [init-keymaps.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-keymaps.vim) 和 [init-plugins.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-plugins.vim) 两个文件，每个点我都写满了注释了，也是未来你自己可能修改的最多的两个文件。每次你修改或者调试了单个 .vim 配置文件后，命令行输入 `:so %` 即可重新载入，so 是 `source` 的简写，意思是加载脚本，`%` 代表当前正在编辑脚本的名字。

# Credit

TODO

# Usage

|                                                              |                   |
| ----------------------- | ------------- |
| preservim/nerdcommenter                | |
| `<C-c>`                 | 注释/取消注释 |
| Yggdroot/LeaderF |               |
| `<C-p>`                 | 文件检索/快速跳转 |
| [ripgrep](https://github.com/BurntSushi/ripgrep) or [ug](https://retzzz.github.io/dc9af5aa/) |               |
| `<leader>fr`  | 将会在命令行显示 `:Leaderf rg -e`, 然后等待用户输入想要查询的正则表达式. |
| `<leader>fra` | 将会直接查询光标所在的词语或者visual模式下选中的词语, 但是没有边界. 没有边界的意思是说如果你查`word`, 包含`abcwordxyz`的行也会被搜到. |
| `<leader>frb` | 将会直接查询光标所在的词语,或者visual模式下选中的词语 但是有边界. 有边界的意思是说如果你查`word`, 包含`abcwordxyz` 的行不会被搜到, 只有包含类似`abc word xyz`字段的行才会被搜到. |
| `<leader>frc` | 将会直接把光标所在的词语或者visual模式下选中的词语作为正则表达式检索, 但是没有边界. |
| `<leader>frd` | 将会直接把光标所在的词语或者visual模式下选中的词语作为正则表达式检索, 但是有边界. |
| [vim-surround](https://github.com/tpope/vim-surround) |  |
| `v` 选中后，`S+<字符>` | 在选中的字符周围插入指定的 `<字符>` |
| `cs<原字符><修改的字符>` | 修改包围的字符 |
| `ds<字符>` | 删除包围的 `<字符>` |
| [ludovicchabant](https://github.com/ludovicchabant)/**[vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)** | 自动生成 ctags，首先在工程目录下新建 `.project` |
| `Ctrl + ]` | 跳转到对应的定义位 |
| `Ctrl + o` | 回退到原来的位置 |
| [markdown-perview](https://github.com/iamcco/markdown-preview.vim)|       |
| `:MarkdownPreview` | Preview markdown with default browser |
| `:MarkdownPreviewStop` | Close the preview window and server |
| python [ref](https://vimjc.com/vim-python-ide.html) |     |
| [jedi-vim](https://github.com/davidhalter/jedi-vim) |     |
| `<Ctrl-Space>` | 插入模式自动补齐 |

