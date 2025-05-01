#!/usr/bin/env python3


from pathlib import Path
import datetime

base_url = "https://hoff-exercise.kaorubb.org/"
dist_dir = Path("dist")
sitemap_path = dist_dir / "sitemap.xml"
exclude_files = {
    Path("js/flowchart.html"),
    Path("js/index.html"),
}
sitemap_entries = []

if not dist_dir.is_dir():
    print(f"Error: Directory not found at {dist_dir}")
else:
    html_files = sorted(dist_dir.rglob("*.html"))
    print(f"Found {len(html_files)} HTML files initially.")
    for file_path in html_files:
        relative_path = file_path.relative_to(dist_dir)

        if relative_path not in exclude_files:
            url = base_url + relative_path.as_posix()
            last_mod_timestamp = file_path.stat().st_mtime
            last_mod_date = datetime.datetime.fromtimestamp(last_mod_timestamp).strftime('%Y-%m-%d')
            sitemap_entries.append({"loc": url, "lastmod": last_mod_date})
        else:
            print(f"Excluded: {relative_path}")

    xml_content = '<?xml version="1.0" encoding="UTF-8"?>\n'
    xml_content += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n'
    for entry in sitemap_entries:
        xml_content += '   <url>\n'
        xml_content += f'      <loc>{entry["loc"]}</loc>\n'
        xml_content += f'      <lastmod>{entry["lastmod"]}</lastmod>\n'
        xml_content += '   </url>\n'
    xml_content += '</urlset>\n'

    try:
        with open(sitemap_path, 'w', encoding='utf-8') as f:
            f.write(xml_content)
        print(f"\nSuccessfully generated sitemap with {len(sitemap_entries)} URLs.")
        print(f"Sitemap saved to: {sitemap_path}")
    except IOError as e:
        print(f"\nError writing sitemap file: {e}")
