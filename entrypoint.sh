#!/bin/bash

# اگر دیتابیس وجود نداشت، یک دیتابیس اولیه ایجاد کن (اختیاری)
if [ ! -f "/etc/x-ui/x-ui.db" ]; then
    echo "No database found. Starting fresh..."
fi

# اجرای پنل 3x-ui
echo "Starting 3x-ui panel on port $PORT..."
exec /usr/local/bin/3x-ui
