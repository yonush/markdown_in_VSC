---
#The ebook export requires https://calibre-ebook.com/download_portable to work
#https://shd101wyy.github.io/markdown-preview-enhanced/#/pandoc
title: Markdown Syntax
author: John Gruber
#this part of the YAML is for Pandoc
output: 
    pdf_document:
        latex_engine: xelatex
        #template: template.tex
        template: default.latex
        toc: true
        toc_depth: 3
        links-as-notes: true
        number_sections: false
  
puppeteer:
    pdf:
        format: A4
        displayHeaderFooter: true
        margin:
            top: 1cm
            right: 1cm
            bottom: 1cm
            left: 1cm
    image:
        quality: 90
        fullPage: true
---

# Test markdown rendering with exports

**Extensions used**

    Name: Markdown Extended
    Id: jebbs.markdown-extended
    Description: Extended syntaxes to built-in markdown & What you see is what you get exporter.
    Version: 1.1.3
    Publisher: jebbs
[VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=jebbs.markdown-extended)


    Name: Markdown Preview Enhanced
    Id: shd101wyy.markdown-preview-enhanced
    Description: Markdown Preview Enhanced ported to vscode
    Version: 0.6.8
    Publisher: Yiyi Wang
[VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)

Alt Heading 1 (Headings need 4 = or -)
Mixing heading styles will cause a linting warning

Normal text **bold** then *italic*.
Escape \* \` \< \_ \# \\ & more.

1. Order list
1. Order list
1. Order list
1. Order list
- Unorder list ( - or + )
- Unorder list ( - or + )
- Unorder list ( - or + )

code: `a === a` `b <= c`

``` js
   //JavaScript
   function test() {

   }
```

``` go
   //Go
   func test() {

   }
```

``` python
   # Python
   def test():
      pass   
```

Font test
oO0l123456789
**Setting for**
Editor: Font Family
    'JetBrains Mono','Fira Code','GoMono NF', Hack, Consolas, 'Courier New', monospace

## Extensions
Markdown Preview Enhanced - MPE
MPE renders this badly and exports to PDF and the browser

**Mermaid rendering**
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

This works with MPE and does not export properly or work for the browser

!!! danger Danger Title
    This is the danger admonition body

!!! note Notice
    This is a note [[ctrl+esc ]]

!!! summary Admonitions
    note | summary, abstract, tldr | info, todo | tip, hint |success, check, done | question, help, faq | warning, attention, caution | failure, fail,missing | danger, error, bug | example, snippet | quote, cite

Page break
<div style="page-break-after: always;"></div>

::::: container
:::: row
::: col-xs-6 alert alert-success
success text
:::
::: col-xs-6 alert alert-warning
warning text
:::
::::
:::::



!!! info Table in an admonition

    | Intro | Structure | Discussion | Mechanics | Total |
    | ----- | --------- | ---------- | --------- | ----- |
    | 5     | 5         | 20         | 5         | 100.0 |
    | 1     | 3         | 10         | 2         | 45.7  |
    | 2     | 3         | 13         | 3         | 60.0  |
    | 5     | 4         | 17         | 4         | 85.7  |
    |       |           |            |           | 0.0   |
    | 4     | 4         | 14         | 3         | 71.4  |
    | 3     | 4         | 15         | 4         | 74.3  |
    | 3     | 5         | 15         | 5         | 80.0  |
    | 5     | 5         | 16         | 5         | 88.6  |
    | 3     | 5         | 14         | 3         | 71.4  |
    |       |           |            |           |       |

Page break
<div style="page-break-after: always;"></div>


## Alternate Math Rendering

$$\phi$$

$$\xi$$

$$c^2 = a^2 + b^2$$

$$\sum_{i=1}^{n} X^3_i$$

$$\sum_{i=1}^{n}\left( \frac{X_i}{Y_i} \right)$$

$$x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$$

$$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$$

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi \xi x} \,d\xi$$

> blockquote

URL: [Edditoria][1] | image: ![2][]

[1]: https://edditoria.blogspot.com
[2]: https://avatars0.githubusercontent.com/u/2234073?v=3&s=40

<!-- please comment -->

## Enjoy! :)
