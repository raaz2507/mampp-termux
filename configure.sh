#!/bin/bash

# हरे रंग में संदेश दिखाने के लिए फ़ंक्शन
function print_progress {
    echo -e "\e[1;32m$1\e[0m"
}

clear
print_progress "इंस्टॉल किया जा रहा है... कृपया प्रतीक्षा करें!"

# स्क्रिप्ट के वर्तमान स्थान के आधार पर conf डायरेक्टरी तय करें
CONF_DIR="$(pwd)/conf"

# यह सुनिश्चित करें कि conf डायरेक्टरी मौजूद है
if [ ! -d "$CONF_DIR" ]; then
    echo "⚠ डायरेक्टरी $CONF_DIR नहीं मिली!"
    exit 1
fi

# आवश्यक पैकेजों को क्रम में इंस्टॉल करें
print_progress "आवश्यक पैकेज इंस्टॉल किए जा रहे हैं..."
pkg install -y php php-apache apache2 mariadb phpmyadmin toilet > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ पैकेज इंस्टॉल करने में विफल! कृपया इंटरनेट कनेक्शन जांचें और पुनः प्रयास करें।"
    exit 1
fi

print_progress "PHP और Apache की कॉन्फ़िगरेशन सेट की जा रही है..."
chmod +x "$CONF_DIR"
mv -f "$CONF_DIR/php" $HOME > /dev/null 2>&1

# यदि पुरानी Apache कॉन्फ़िगरेशन मौजूद है तो उसे हटाएं
if [ -f "$PREFIX/etc/apache2/httpd.conf" ]; then
    rm -r $PREFIX/etc/apache2/httpd.conf > /dev/null 2>&1
fi

# नई कॉन्फ़िगरेशन को स्थानांतरित करें
mv -f "$CONF_DIR/httpd.conf" $PREFIX/etc/apache2 > /dev/null 2>&1
mv -f "$CONF_DIR/php_module.conf" $PREFIX/etc/apache2/extra > /dev/null 2>&1
chmod 600 $PREFIX/etc/apache2/httpd.conf
chmod 644 $PREFIX/etc/apache2/extra/php_module.conf

# phpMyAdmin को तैयार करना
print_progress "phpMyAdmin को तैयार किया जा रहा है..."

# सुनिश्चित करें कि लक्ष्य डायरेक्टरी मौजूद हो
mkdir -p $HOME/php/htdocs

# यदि symlink पहले से नहीं है तो phpMyAdmin का symlink htdocs में बनाएं
if [ ! -L "$HOME/php/htdocs/phpmyadmin" ]; then
    ln -s $PREFIX/share/phpmyadmin $HOME/php/htdocs/phpmyadmin
    print_progress "✅ phpMyAdmin का symlink सफलतापूर्वक बनाया गया।"
else
    print_progress "✅ phpMyAdmin का symlink पहले से मौजूद है।"
fi

# config.inc.php को conf फ़ोल्डर से बदलें
if [ -f "$CONF_DIR/config.inc.php" ]; then
    cp -f "$CONF_DIR/config.inc.php" $HOME/php/htdocs/phpmyadmin/config.inc.php
    chmod 660 $HOME/php/htdocs/phpmyadmin/config.inc.php
    print_progress "✅ phpMyAdmin की कॉन्फ़िगरेशन सफलतापूर्वक अपडेट की गई।"
else
    echo "⚠ config.inc.php फाइल $CONF_DIR फ़ोल्डर में नहीं मिली!"
fi

# start-server और stop-server स्क्रिप्ट को तैयार करना
print_progress "सर्वर को तैयार किया जा रहा है..."

if [ -f "$CONF_DIR/start-server" ]; then
    mv -f "$CONF_DIR/start-server" $PREFIX/bin/start-server
    chmod +x $PREFIX/bin/start-server
    print_progress "✅ start-server स्क्रिप्ट सफलतापूर्वक स्थानांतरित की गई।"
else
    echo "⚠ start-server स्क्रिप्ट $CONF_DIR फ़ोल्डर में नहीं मिली!"
fi

if [ -f "$CONF_DIR/stop-server" ]; then
    mv -f "$CONF_DIR/stop-server" $PREFIX/bin/stop-server
    chmod +x $PREFIX/bin/stop-server
    print_progress "✅ stop-server स्क्रिप्ट सफलतापूर्वक स्थानांतरित की गई।"
else
    echo "⚠ stop-server स्क्रिप्ट $CONF_DIR फ़ोल्डर में नहीं मिली!"
fi

# स्क्रीन को साफ़ करें और अंतिम संदेश दिखाएं
clear
print_progress "✅ कॉन्फ़िगरेशन पूर्ण हो चुकी है!"
print_progress "कृपया सेवाओं को चालू करने के लिए निम्नलिखित कमांड चलाएं:"
print_progress "- start-server सर्वर को चालू करने के लिए"
print_progress "- stop-server सर्वर को बंद करने के लिए"

echo ""
print_progress "🌐 सर्वर चल रहा है: http://localhost:8080/"
print_progress "📌 डेटाबेस उपलब्ध है: http://localhost:8080/phpmyadmin"
