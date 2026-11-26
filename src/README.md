# Usage
1. Start a container using the following command, in the container
latex is installed.
```bash
make run-develop
```

2. Build your resume using the following command.
```bash
make build
```

# Persian CV
The Persian CV is a single HTML page, `fa-html/resume.html`, using the Vazirmatn
font in `fonts/`. It is printed to PDF with headless Google Chrome on macOS,
outside the LaTeX container:
```bash
make fa
```
This writes `fa-html/resume.pdf`, a preview image `fa-html/page1.png`, and a copy
named `CV.Amir Mahdi Khazaei.fa.pdf`. The page must stay on one A4 page; the
script prints the page count.
