# Using the Markdown resources

This folder contains various markdown examples with the primary example using markdown with Visual Studio Code and various extensions.

# VScode Extensions used
    
``` text
    Name: Markdown Extended
    Id: jebbs.markdown-extended
    Description: Extended syntaxes to built-in markdown & 
                 What you see is what you get exporter.
    Version: 1.1.3
    Publisher: jebbs
```    
[VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=jebbs.markdown-extended)

``` text
    Name: Markdown Preview Enhanced
    Id: shd101wyy.markdown-preview-enhanced
    Description: Markdown Preview Enhanced ported to vscode
    Version: 0.6.8
    Publisher: Yiyi Wang
```

[VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)

## Rendering a simple PDF

The simple PDF/HTML/ePub creation only uses the **Markdown Extended** extension from above. The extension will automatically install the required Chrome **Puppeteer** component that performs the actual file conversion process.

Example metadata (YAML code added to the top) can be found at the top of the markdown.md document.

Once markdown text has been written and saved, you can right-click and select the *Export to File* which should present you with the following selection:

- Self-contained HTML file
- PDF File
- PNG File
- JPG File


There are some HTML comments contained in the markdown that effect how the PDF is going to be rendered. These impact the

- table of contents (TOC) using the markdown tag "[TOC]" (without the quotes) and
- specific pagebreaks using HTML code.

### Page breaks

Page breaks using the **Markdown Extended** extension and **Puppeteer** can be down with some HTML code such as the following:

``` HTML
    <div style="page-break-after: always;"></div>
```

These page breaks only impact PDFs and not the self-contained HTML output.

If you are only using the above extension then remove the or don't use the LaTex command for the pagebreak as shown below:

```Tex
    \pagebreak
```

## Rendering a more complex PDF

Refer to the markdown.pdf for an example of the PDF output using this process.

The PDF created through this process requires additional tools in conjunction with the **Markdown Preview Enhanced** (MPE) extension:

- [Pandoc](https://pandoc.org/) a universal document converter to produce the book like PDF version.
    The following VScode setting was used for Pandoc and Markdown Preview Enhanced integration
    
        "markdown-preview-enhanced.pandocArguments": [
            "--standalone"
        ],

- [MikTex](https://miktex.org/) TeX distribution is also required for Pandoc to correctly render the PDF.

The files used to create the markdown.PDF are as follows

- coverpage.docx - exported to create the coverpage.pdf
- coverpage.tex - includes the coverpage.pdf and additional frontmatter
- default.text - modified pandoc template to include the coverpage
- markdown.md - the PDF content which includes the YAML metadata.

Examine the YAML metadata at the top of the markdown.md. Most of the settings can be left as they are but they also help with creating your own documents.

### Page breaks

Page breaks using the above **MPE** extension and Pandoc use the *LaTex* command

```Tex
    \pagebreak
```

If you use the *Chrome (Puppeteer)* option using the **MPE** extension then the same rules apply as with the **Markdown Extended** extension.

## Generating ePubs

ePubs documents can be generated outside of the above two extensions using Pandoc directly. An example of this can be found on the *examples\epub* folder and using the batch file make-book.cmd.

The command line looks like the following if you want to just generate a simple ePub but refer to the batch file for additional settings/configurations.

```sh
> PANDOC "markdown.md" -o "markdown.epub" -t epub+smart 
```

-end-of-file-