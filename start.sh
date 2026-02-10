#!/bin/bash

# 1. SSH service background mein start karna
service ssh start

# 2. Ngrok ko authenticate karna tumhare dummy token se
ngrok config add-authtoken 39HzNPiIb8RClKLaDGAj8diHbij_2jQMrAxW38opubeEzRyLG

# 3. Ngrok start karna TCP tunnel ke sath aur log output dikhana
ngrok tcp 22 --log=stdout &

# 4. Render ko zinda rakhne ke liye ek dummy web server port 10000 par start karna
echo "Ubuntu VPS is Running smoothly!" > index.html
python3 -m http.server 10000
