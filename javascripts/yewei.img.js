document.addEventListener('DOMContentLoaded', function() {
    const domain = window.location.hostname; // 获取当前域名
    const imgSrc = `https://count.getloli.com/@${domain}?name=${domain}&theme=green&padding=6&offset=0&align=top&scale=1&pixelated=1&darkmode=auto`;

    // 创建一个容器元素，使图片居中对齐
    const imgContainer = document.createElement('div');
    imgContainer.style.textAlign = 'center'; // 设置图片居中对齐
    imgContainer.style.marginTop = '20px'; // 增加与正文间隔

    // 创建图片元素
    const img = document.createElement('img');
    img.src = imgSrc;
    img.alt = 'count';
    img.style.maxWidth = '25%'; // 设置最大宽度为50%以调小图片
    img.style.height = 'auto'; // 保持原始比例
    imgContainer.appendChild(img);

    // 将容器插入到文档内容末尾
    const content = document.querySelector('.md-content'); // 选择主内容区域
    if (content) {
        content.appendChild(imgContainer);
    }
});
