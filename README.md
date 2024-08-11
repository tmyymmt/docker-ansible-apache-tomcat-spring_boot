# Docker and Ansible Sample (Apache HTTP Server, Tomcat, Spring Boot)

This is a sample for deploying a Spring Boot application in an environment built with Docker and Ansible.

Everything will be installed on a single server.

The environment is constructed using versions that contain vulnerabilities.

## Components

| Component        | Version |                                                                                                                                    Vulnerability                                                                                                                                    | Note              |
|:-----------------|:-------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:------------------|
| Apache           | 2.4.60  |                                                                                                          [CVE-2024-39884](https://www.cve.org/CVERecord?id=CVE-2024-39884)                                                                                                          |                   |
| Tomcat           | 10.1.15 |                                                                                                          [CVE-2023-46589](https://www.cve.org/CVERecord?id=CVE-2023-46589)                                                                                                          |                   |
| Oracle Jave SE   | 21.0.1  |                                                                                                          [CVE-2024-20918](https://www.cve.org/CVERecord?id=CVE-2024-20918)                                                                                                          |                   |
| Spring Boot      |  3.0.4  |                                                                                                          [CVE-2023-20873](https://www.cve.org/CVERecord?id=CVE-2023-20873)                                                                                                          |                   |
| Spring Framework |  6.0.6  | [CVE-2023-34053](https://www.cve.org/CVERecord?id=CVE-2023-34053)<br/>[CVE-2023-20863](https://www.cve.org/CVERecord?id=CVE-2023-20863)<br/>[CVE-2023-20861](https://www.cve.org/CVERecord?id=CVE-2023-20861)<br/>[CVE-2023-20860](https://www.cve.org/CVERecord?id=CVE-2023-20860) | Speing Boot 3.0.4 |

# Usage

1. Start the container and enter the web container.

    ```shell
    docker compose up -d
    docker exec -it web /bin/bash
    ```
2. Inside the web container, run the following commands.

    You can choose project type from the following.

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

3. Access https://localhost:8443/ .
