<div align="center">

# 📔 Sekai Memory Book · 二次元回忆录

> ⭐ Sekai 系列实战项目 03 / 14 · 单项目独立仓库

![Java](https://img.shields.io/badge/Java-red?style=flat-square&logo=openjdk&logoColor=white) ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=flat-square&logo=springboot&logoColor=white) ![MyBatis](https://img.shields.io/badge/MyBatis-blue?style=flat-square) ![Thymeleaf](https://img.shields.io/badge/Thymeleaf-blue?style=flat-square) ![MySQL](https://img.shields.io/badge/MySQL-blue?style=flat-square)

[![Stars](https://img.shields.io/github/stars/sekai-lyr/memory-3?style=flat-square&logo=github)](https://github.com/sekai-lyr/memory-3/stargazers) [![合集](https://img.shields.io/badge/📚_全系列合集-sekai--product-8250DF?style=flat-square)](https://github.com/sekai-lyr/sekai-product)

</div>

---

一个用于记录番剧、角色和台词的私人二次元回忆录。

## 已有功能

- 用户注册、登录、退出
- 密码带盐哈希存储，并兼容旧明文密码自动升级
- 番剧新增、编辑、删除、搜索、分页
- 角色收藏新增、删除
- 台词摘录新增、删除
- MySQL 建表脚本和示例种子数据

## 本地运行

1. 修改 `src/main/resources/application.properties` 中的 MySQL 用户名和密码。
2. 初始化数据库：

```powershell
cmd /c "mysql -uroot -p123456 --default-character-set=utf8mb4 < build-data\sekai.sql"
cmd /c "mysql -uroot -p123456 --default-character-set=utf8mb4 < build-data\user3-anime-seed.sql"
cmd /c "mysql -uroot -p123456 --default-character-set=utf8mb4 < build-data\user3-anime-seed-2.sql"
cmd /c "mysql -uroot -p123456 --default-character-set=utf8mb4 < build-data\sekai-anime-watch-date.sql"
```

3. 启动项目：

```powershell
mvn spring-boot:run
```

4. 浏览器打开 `http://localhost:8080`。

## 验证

```powershell
mvn test
```

---

## 🗺️ Sekai 项目全景导航

本项目是 **Sekai 系列作品集** 的一员，全部 14 个实战项目：

| 项目 | 简介 |
|------|------|
| [`memory-1`](https://github.com/sekai-lyr/memory-1) | 📊 二次元数据中心 |
| [`memory-2`](https://github.com/sekai-lyr/memory-2) | 🛒 二次元电商商城 |
| [`memory-3`](https://github.com/sekai-lyr/memory-3) | 📔 二次元回忆录 |
| [`memory-4`](https://github.com/sekai-lyr/memory-4) | 🎋 角色抽签与今日运势 |
| [`memory-5`](https://github.com/sekai-lyr/memory-5) | 🎵 歌词同步音乐播放器 |
| [`memory-6`](https://github.com/sekai-lyr/memory-6) | 🎮 原创角色合成小游戏 |
| [`memory-7`](https://github.com/sekai-lyr/memory-7) | 🖼️ 二次元壁纸图库系统 |
| [`memory-8`](https://github.com/sekai-lyr/memory-8) | 📖 英语单词学习系统 |
| [`memory-9`](https://github.com/sekai-lyr/memory-9) | 📝 表单收集与 AI 对话系统 |
| [`memory-10`](https://github.com/sekai-lyr/memory-10) | 📺 动漫视频导航站 |
| [`memory-11`](https://github.com/sekai-lyr/memory-11) | ⚔️ 游戏王规则卡牌对战 |
| [`memory-12`](https://github.com/sekai-lyr/memory-12) | 🎓 游戏化学习平台 |
| [`memory-13`](https://github.com/sekai-lyr/memory-13) | 🎭 Ren'Py 视觉小说 |
| [`memory-14`](https://github.com/sekai-lyr/memory-14) | 🤖 识番推荐与 RAG 助手平台 |

📦 **一站式浏览全部项目**：[sekai-lyr/sekai-product](https://github.com/sekai-lyr/sekai-product)（monorepo 合集）

<div align="center">

**如果这个项目对你有帮助或启发，欢迎点一个 ⭐ Star 支持一下！**

*Made with ❤️ by [sekai-lyr](https://github.com/sekai-lyr)*

</div>
