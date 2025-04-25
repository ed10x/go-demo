# go-demo

Collection of Go examples organized by categories
# Go Demo Repository

[![Go Version](https://img.shields.io/badge/go-1.21%2B-blue)](https://golang.org/dl/)

专业的Go语言示例集合，采用多分支模块化管理方案。

## 项目结构

### 分支体系
```
main         - 主分支（仅包含README）
├── ai-dev       - AI开发示例分支
├── syntax       - 语言特性分支
├── design-patterns - 设计模式分支
├── leetcode     - 算法题库分支
├── tips         - 开发技巧分支
└── web-dev      - Web开发分支
```

### 目录结构（每个特性分支）
```
/[category-name]     # 分类目录
├── examples/      # 示例目录（建议结构）
│   └── example1/  # 独立示例目录
│       ├── main.go
│       └── go.mod # 示例特定依赖（可选）
├── .keep          # 占位文件
└── go.mod         # 分类级依赖
```

## 快速开始

### 克隆仓库
```bash
git clone https://github.com/ed10x/go-demo.git
cd go-demo
```

### 查看可用分支
```bash
git branch -a
```

### 切换到指定分类
```bash
git checkout ai-dev
```

### 运行示例
1. 进入具体示例目录
2. 初始化依赖（如果需要）：
   ```bash
   go mod tidy
   ```
3. 运行程序：
   ```bash
   go run .
   ```

## 分支管理策略

### 创建新分类
```bash
git checkout -b new-category main
mkdir new-category
go mod init github.com/your_username/go-demo/new-category
git add . && git commit -m "init new-category"
```

### 添加新示例
1. 切换到对应分支
2. 创建示例目录：
   ```bash
   mkdir -p ai-dev/examples/llm-demo
   ```
3. 初始化示例模块：
   ```bash
   cd ai-dev/examples/llm-demo && go mod init llm-demo
   ```

## 依赖管理

本项目采用分级模块管理：
1. 分类级模块：分支根目录的go.mod
2. 示例级模块（可选）：具体示例目录中的go.mod

建议管理方式：
```bash
# 分类级依赖
go get -d github.com/tensorflow/tensorflow@v2.14.0

# 示例级依赖（进入示例目录）
go get -d github.com/sashabaranov/go-openai@v1.17.0
```

## 最佳实践

1. 跨分类引用：通过绝对路径引用
   ```go
   import "github.com/your_username/go-demo/syntax/concurrency"
   ```

2. 版本控制建议：
   ```bash
   # 在分类分支提交
   git checkout ai-dev
   git add . && git commit -m "feat: add machine learning example"
   
   # 合并到main分支（仅文档更新）
   git checkout main
   git merge ai-dev -m "docs: update ai-dev catalog"
   ```

## 贡献指南

欢迎通过以下方式参与贡献：
1. 通过Issue提出新示例需求
2. 直接提交Pull Request到对应分类分支
3. 完善现有示例的文档说明

代码规范要求：
- 每个独立示例应有完整的Go Doc注释
- 复杂示例需包含README_example.md说明
- 保持模块依赖的最小化原则
