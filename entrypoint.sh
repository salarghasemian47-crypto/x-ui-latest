#!/bin/bash
# این اسکریپت بررسی می‌کند که آیا دیتابیس وجود دارد یا خیر
if [ ! -f "/etc/x-ui/x-ui.db" ]; then
    echo "First time setup..."
    # اینجا می‌توانید دستورات اولیه را اضافه کنید
fi

/usr/local/bin/3x-ui
