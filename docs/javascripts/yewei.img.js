document.addEventListener('DOMContentLoaded', function() {
    // 在这里定义 fullUrl，确保它在 DOMContentLoaded 事件触发时可用
    const fullUrl = window.location.href; // 获取当前完整 URL
	
    // 使用 URL 对象提取域名和路径
    const url = new URL(fullUrl);
    const domain = url.hostname; // 获取域名
    const path = url.pathname.replace(/[^a-zA-Z0-9_]/g, ''); // 只保留字母、数字、下划线

    // 组合域名和路径
    const sanitizedUrl = `${domain}${path}`; // 组合成完整的安全 URL

    // 检查构建的 URL
    console.log("Sanitized URL: ", sanitizedUrl);
	
    const imgSrc = `https://count.getloli.com/@${sanitizedUrl}?theme=green&padding=6&offset=0&align=top&scale=1&pixelated=1&darkmode=auto`;

    // 创建一个容器元素，使图片居中对齐
    const imgContainer = document.createElement('div');
    imgContainer.style.textAlign = 'center'; // 设置图片居中对齐
    imgContainer.style.marginTop = '20px'; // 增加与正文间隔

    // 创建图片元素
    const img = document.createElement('img');
    img.src = imgSrc;
    img.alt = 'count';
    img.style.maxWidth = '25%'; // 设置最大宽度为25%以调小图片
    img.style.height = 'auto'; // 保持原始比例
    imgContainer.appendChild(img);

    // 将容器插入到文档内容末尾
    const content = document.querySelector('.md-content'); // 选择主内容区域
    if (content) {
        content.appendChild(imgContainer);
    }
});