
# 🌐 Xampp - Termux v.1.0.1 | 2025

## 🧩 Apache, Mysql, Mariadb, PHP, PhpMyAdmin

## ✨ विशेषताएँ

- अब Termux में XAMPP बिना किसी अतिरिक्त कॉन्फ़िगरेशन के चलाइए

## 🛠️ तकनीकें

- [TERMUX](https://termux.dev/en/) - Termux एक Android टर्मिनल एमुलेटर और Linux एनवायरनमेंट ऐप है, जो बिना किसी रूट या सेटअप के सीधा काम करता है। इसमें एक न्यूनतम बेस सिस्टम ऑटोमेटिकली इंस्टॉल हो जाता है और अन्य पैकेज `APT` मैनेजर से इंस्टॉल किए जा सकते हैं।

- [PHP](https://www.php.net/) - एक प्रसिद्ध सामान्य उद्देश्य की स्क्रिप्टिंग भाषा जो विशेष रूप से वेब डेवलपमेंट के लिए उपयुक्त है।

- [APACHE](https://httpd.apache.org/) - Apache HTTP सर्वर प्रोजेक्ट का उद्देश्य एक सुरक्षित, कुशल और विस्तार योग्य HTTP सर्वर बनाना है जो मौजूदा HTTP मानकों के अनुसार सेवाएं प्रदान करे।

- [MARIADB](https://mariadb.org/documentation/) - MariaDB सर्वर के लिए आधिकारिक दस्तावेजों का स्रोत, जो MySQL का बेहतर और ओपन-सोर्स विकल्प है।

- [PHPMYADMIN](https://www.phpmyadmin.net/) - यह एक फ्री PHP टूल है जो वेब पर MySQL और MariaDB का एडमिनिस्ट्रेशन आसान बनाता है।

## 📋 आवश्यकताएँ

- Apache: 2.4.63  
- PHP: 8.4.2  
- PhpMyAdmin: 5.2.2  
- MariaDB: 11.8.0

## 📁 संरचना

```
📦Xampp-termux
 ┣ 📂conf
 ┃ ┗ 📂php/htdocs
 ┃ ┣ 📜httpd.conf
 ┃ ┣ 📜php_module.conf
 ┃ ┣ 📜start-server
 ┃ ┣ 📜stop-server
 ┃ ┣ 📜config.inc.php
 ┗ 📜configure.sh
```

## 🧪 इंस्टॉलेशन प्रक्रिया

✅ पहले सुनिश्चित करें कि आपने Termux इंस्टॉल किया है – [यहाँ से डाउनलोड करें](https://drive.google.com/file/d/17P5y-IKhXcWPfc8lp5s0LQH3hvZOlKgQ/view?usp=drive_link)

📱 फिर Termux ऐप को खोलें

**अब नीचे दिए गए स्टेप्स फॉलो करें:**

1. ```bash
   apt update && apt upgrade -y
   ```

   🔔 नोट: यदि कोई पुष्टि मांगी जाए तो 'y' या 'Y' दबाएं।

2. ```bash
   pkg install git -y
   ```

3. ```bash
   git clone https://github.com/ANGEOM21/mampp-termux.git
   ```

   💡 नोट: अगर Git का उपयोग कर रहे हैं तो पहले GitHub CLI इंस्टॉल करें  

   ```bash
   pkg install gh -y
   ```  

   फिर GitHub में लॉगिन करें।

4. ```bash
   cd mampp-termux
   ```

5. ```bash
   ./configure.sh
   ```

✅ अगर ऊपर की सारी स्टेप्स पूरी हो गई हैं तो अब सर्वर स्टार्ट करें:

```bash
./start-server
```

🔗 **अब ब्राउज़र में खोलें:** `localhost:8080`  
🔐 **phpMyAdmin खोलने के लिए:** `localhost:8080/phpmyadmin`

🛑 सर्वर को बंद करने के लिए:

```bash
./stop-server
```

---

### 📍 नोट

आपके Termux होम फोल्डर में `php/htdocs` डायरेक्टरी मौजूद होगी। यदि आप वहां कोई प्रोजेक्ट या फोल्डर डालना चाहते हैं:

```bash
cd php/htdocs
```

💻 फिर आप अपने मोबाइल में Termux के ज़रिए बिलकुल उसी तरह वेबसाइट चला सकते हैं जैसे लैपटॉप में XAMPP से।

---

अगर आप इसका APK एडिटर या Termux से कनेक्शन वाला टूल चाहते हैं, तो नीचे दिए गए सोशल मीडिया पर मैसेज कीजिए —  
आपके लिए खास बना दूँगी ❤️

---

### 🎉 **शुभकामनाएँ!**

---

### 🙏 क्रेडिट्स

- [an_geom21 - Instagram](https://www.instagram.com/an_geom21/)
- [angeom21 - Telegram](https://t.me/angeom21)
