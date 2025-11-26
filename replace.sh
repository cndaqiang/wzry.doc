#!/bin/bash

# 查找所有.md文件并进行替换操作
find . -type f -name "*.md" | while read file; do
    # 显示处理中的文件名
    echo "处理文件: $file"
    
    # 使用sed进行原地替换（兼容macOS和Linux）
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' 's/王者荣耀/WZRY/g' "$file"
    else
        sed -i 's/王者营地/WZYD/g' "$file"
    fi
done

echo "替换完成"

