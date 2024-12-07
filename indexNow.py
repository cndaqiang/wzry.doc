#推送sitemap到indexNow
#https://www.indexnow.org/documentation
import requests
import xml.etree.ElementTree as ET

# 读取并解析 XML 文件
tree = ET.parse('./site/sitemap.xml')
root = tree.getroot()

# 去除命名空间前缀
for elem in root.iter():
    # 获取标签名，去除前缀
    elem.tag = elem.tag.split('}', 1)[-1]  # 仅保留标签名

# 提取所有 <loc> 标签内容
url_list = [loc.text for loc in root.iter('loc')]
#添加自定义地址
url_list.extend(['https://wzry-doc.pages.dev/feed_rss_updated.xml'])
url_list.extend(['https://wzry-doc.pages.dev/feed_rss_created.xml'])
url_list.extend(['https://wzry-doc.pages.dev/sitemap.xml'])
url_list.extend(['https://wzry-doc.pages.dev/sitemap.txt'])
#



url = "https://api.indexnow.org/IndexNow"
headers = {
    "Content-Type": "application/json; charset=utf-8"
}
data = {
    "host": "wzry-doc.pages.dev",
    "key": "ad27cc485af5400a992275f8aac9c003",
    "keyLocation": "https://wzry-doc.pages.dev/ad27cc485af5400a992275f8aac9c003.txt",
    "urlList": url_list
}

response = requests.post(url, headers=headers, json=data)

print("Status Code:", response.status_code)
print("Response Text:", response.text)

#exit()
#增加其他的域名
url_list = [url.replace('wzry-doc.pages.dev', 'cndaqiang.github.io/wzry.doc') for url in url_list]
data = {
    "host": "cndaqiang.github.io",
    "key": "a02ce590e4494bf8900d5080b244ac07",
    "keyLocation": "https://cndaqiang.github.io/a02ce590e4494bf8900d5080b244ac07.txt",
    "urlList": url_list
}
response = requests.post(url, headers=headers, json=data)

print("Status Code:", response.status_code)
print("Response Text:", response.text)
# 生成新域名的 URL 列表
# 将新 URL 添加到原始 url_list 中
