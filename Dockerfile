# استخدام صورة Puppeteer الرسمية التي تحتوي على Chrome مثبت مسبقاً
FROM ghcr.io/puppeteer/puppeteer:24.14.0

# تعيين مجلد العمل
WORKDIR /usr/src/app

# نسخ ملفات package
COPY package*.json ./

# تثبيت الحزم
RUN npm ci --only=production && npm cache clean --force

# نسخ باقي الملفات
COPY . .

# فتح المنفذ
EXPOSE 3000

# تشغيل التطبيق
CMD ["node", "server.js"]
