# Sekai Memory Book

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
