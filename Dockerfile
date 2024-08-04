# ベースイメージとしてRocky Linux 8.6を使用
FROM rockylinux:9.3

RUN dnf update -y && \
    dnf install -y epel-release && \
    dnf install -y systemd-udev && \
    dnf install -y procps-ng && \
    dnf install -y emacs && \
    dnf install -y ansible && \
    dnf clean all

# systemdがフォアグラウンドで実行されるように環境変数を設定
ENV container docker

# cgroupディレクトリをマウント
VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/opt/project" ]
VOLUME [ "/opt/ansible" ]

CMD ["ansible", "--version"]

CMD ["/usr/sbin/init"]
