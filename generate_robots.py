def generate_robots():
    robots_txt = "User-agent: *\nDisallow: /"  # 禁止所有爬虫访问

    # 将内容写入 docs 目录中的 robots.txt 文件
    with open("docs/robots.txt", "w") as file:
        file.write(robots_txt)

if __name__ == "__main__":
    generate_robots()