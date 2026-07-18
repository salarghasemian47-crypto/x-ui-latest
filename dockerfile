FROM ghcr.io/mhsanaei/3x-ui:latest

# تنظیمات اولیه برای کار با دیتابیس خارجی
ENV DB_TYPE=postgres
ENV XUI_PORT=8080

EXPOSE 8080

# دستور اجرا
CMD ["/usr/local/bin/x-ui"]
