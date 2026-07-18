# استفاده از ایمیج رسمی و بهینه شده 3x-ui
FROM ghcr.io/mhsanaei/3x-ui:latest

# تعیین پورت اصلی پنل (مطابق با تنظیمات Railway)
EXPOSE 8080

# دستور اجرای پنل
CMD ["/usr/local/bin/x-ui"]
