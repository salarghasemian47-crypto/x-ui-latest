# استفاده از یک ایمیج سبک لینوکس
FROM debian:latest

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    && rm -rf /var/lib/apt/lists/*

# دانلود و نصب اسکریپت 3x-ui (نسخه رسمی/محبوب)
# توجه: چون Railway محیط ایستا دارد، بهتر است مستقیم فایل باینری یا اسکریپت نصب را اجرا کنیم
RUN curl -Ls https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh | bash -s -- install

# تنظیم پورت (Railway پورت را از Environment Variable می‌خواند)
# اما برای پنل باید یک پورت ثابت هم داشته باشیم، مثلاً 2053
ENV PORT=2053
EXPOSE 2053

# اجرای پنل
# نکته: در محیط Docker باید دستور شروع پنل را مستقیماً صدا بزنیم
CMD ["/usr/local/bin/3x-ui"]
