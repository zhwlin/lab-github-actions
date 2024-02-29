#!/bin/bash

# 匹配的正则表达式
regex="^v?\d+(\.\d+){0,2}(-[a-zA-Z]+\d*)?$"

# 输入的字符串
while [ true ]; do
    read -p "请输入字符串: " input

    # if [[ $input =~ $regex ]]; then
    #     echo "y"
    # else
    #     echo "n"
    # fi
    echo "<$input>" 
    if [[ $input =~ ^v?[0-9]+(\.[0-9]+){0,2}(-[a-zA-Z]+[0-9]*)?$ ]]; then
      echo "y"
    else
        echo "n"
    fi
done