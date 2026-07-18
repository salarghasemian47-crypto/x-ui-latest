# استفاده از نسخه پایدار دبیان
FROM debian:bookworm-slim

# تنظیم متغیرهای محیطی برای جلوگیری از تعامل در هنگام نصب
ENV DEBIAN_FRONTEND=noninteractive

# نصب پیش‌نیازهای ضروری
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    iproute2 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# ایجاد پوشه برای ذخیره دیتابیس (بسیار مهم برای جلوگیری از پاک شدن تنظیمات)
RUN mkdir -p /etc/x-ui && mkdir -p /var/lib/x-ui

# دانلود و نصب اسکریپت رسمی 3x-ui
# ما از نسخه MHSanaei استفاده می‌کنیم که محبوب‌ترین و به‌روزترین است
RUN curl -Ls https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh | bash -s -- install

# تنظیم پورت پیش‌فرض پنل
ENV PORT=2053
EXPOSE 2053

# اجرای پنل به صورت مستقیم
# استفاده از مسیر مستقیم باینری برای اطمینان از اجرا در Docker
CMD ["/entrypoint.sh"]
