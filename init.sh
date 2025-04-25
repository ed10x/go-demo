#!/bin/zsh

# 初始化仓库
#git clone git@github.com:ed10x/go-demo.git
#cd go-demo || exit

# 设置基础信息
USERNAME="ed10x"  # 修改为您的GitHub用户名
MODULE_PREFIX="github.com/$USERNAME/go-demo"

# 创建主分支
echo "# go-demo\n\nCollection of Go examples organized by categories" > README.md
git add README.md init.sh
git commit -m "chore: initial commit"
git branch -M main

# 定义分类目录
categories=(
    "ai-dev"
    "syntax"
    "design-patterns"
    "leetcode"
    "tips"
    "web-dev"
)

# 创建各特性分支
for category in "${categories[@]}"; do
    # 创建并切换分支
    git checkout -b "$category" main
    
    # 创建目录和.keep文件
    mkdir -p "$category"
    touch "$category/.keep"
    
    # 初始化Go模块
    go mod init "$MODULE_PREFIX/$category"
    
    # 提交更改
    git add .
    git commit -m "chore: initialize $category category"
done

# 返回main分支
git checkout main

echo "Repository initialization completed."
echo "Available branches:"
git branch --list
