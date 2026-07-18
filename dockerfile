# استفاده از نسخه سبک دبیان
FROM debian:bookworm-slim

# جلوگیری از توقف نصب به دلیل سوالات سیستم
ENV DEBIAN_FRONTEND=noninteractive

# نصب ابزارهای ضروری
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# ایجاد پوشه‌های مورد نیاز برای دیتابیس و تنظیمات
RUN mkdir -p /etc/x-ui && mkdir -p /var/lib/x-ui

# دانلود مستقیم آخرین نسخه باینری از گیت‌هاب MHSanaei
RUN curl -L https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-amd64.tar.gz -o x-ui.tar.gz \
    && tar -zxvf x-ui.tar.gz \
    && mv x-ui /usr/local/bin/3x-ui \
    && chmod +x /usr/local/bin/3x-ui \
    && rm x-ui.tar.gz

# تنظیم پورت پیش‌فرض
ENV PORT=2053
EXPOSE 2053

# استفاده از اسکریپت ورود برای مدیریت بهتر
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
