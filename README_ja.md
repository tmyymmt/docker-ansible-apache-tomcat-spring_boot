# DockerとAnsibleのサンプル  (Apache HTTP Server, Tomcat, Spring Boot)

DockerとAnsibleで構築した環境に、Spring Bootアプリケーションをデプロイするサンプルです。

サーバ1台に全て入れます。

脆弱性を含むバージョンで構築します。

## 構成

| 構成物              |  バージョン  |                                                                                                     脆弱性                                                                                                     | 備考                |
|:-----------------|:-------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:------------------| 
| Apache           | 2.4.60  |                                                                               https://www.cve.org/CVERecord?id=CVE-2024-39884                                                                               |                   |
| Tomcat           | 10.1.15 |                                                                               https://www.cve.org/CVERecord?id=CVE-2023-46589                                                                               |                   |
| Oracle Jave SE   | 21.0.1  |                                                                               https://www.cve.org/CVERecord?id=CVE-2024-20918                                                                               |                   |
| Spring Boot      |  3.0.4  |                                                                               https://www.cve.org/CVERecord?id=CVE-2023-20873                                                                               |                   |
| Spring Framework |  6.0.6  | https://www.cve.org/CVERecord?id=CVE-2023-34053<br/>https://www.cve.org/CVERecord?id=CVE-2023-20863<br/>https://www.cve.org/CVERecord?id=CVE-2023-20861<br/>https://www.cve.org/CVERecord?id=CVE-2023-20860 | Speing Boot 3.0.4 |

# 使用方法

1. コンテナを起動し、webコンテナに入る。

    ```shell
    docker compose up -d
    docker exec -it web /bin/bash
    ```

2. webコンテナ内で以下のコマンドを実行する。

   MavenかGradleを選択できます。

   - Maven Project
       ```shell
       cd /opt/ansible-maven
       ansible-playbook install.yml
       ansible-playbook deploy.yml
       ```

   - Gralde Project
       ```shell
       cd /opt/ansible-gradle
       ansible-playbook install.yml
       ansible-playbook deploy.yml
       ```

3. https://localhost:8443/ にアクセスする。
