# استفاده از نسخه سبک و پایدار
FROM debian:bookworm-slim

# جلوگیری از سوالات تعاملی در هنگام نصب
ENV DEBIAN_FRONTEND=noninteractive

# نصب پیش‌نیازهای حیاتی
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    tar \
    iproute2 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# ساخت پوشه‌های مورد نیاز
RUN mkdir -p /etc/x-ui && mkdir -p /usr/local/bin

# دانلود مستقیم فایل باینری پنل (به جای استفاده از اسکریپت نصب که خطا می‌دهد)
# ما مستقیم فایل اجرایی را دانلود می‌کنیم
RUN curl -L https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-amd64.tar.gz -o x-ui.tar.gz \
    && tar -zxvf x-ui.tar.gz \
    && mv x-ui /usr/local/bin/3x-ui \
    && chmod +x /usr/local/bin/3x-ui \
    && rm x-ui.tar.gz

# تنظیم محیط
ENV PORT=2053
EXPOSE 2053

# اجرای پنل
# استفاده از فلگ -d برای اطمینان از اینکه در پس‌زمینه گیر نمی‌کند (هرچند در داکر معمولا نیاز نیست)
CMD ["/usr/local/bin/3x-ui"]
