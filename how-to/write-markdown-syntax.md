# Markdown Formatting Guide

Markdown is a lightweight markup language that allows you to format text easily. This guide will show you how to format various elements using Markdown.

## Headers

Headers are used to create titles and headings in your document. Markdown supports six levels of headers, with `#` representing the highest level (H1) and `######` the lowest (H6).

```markdown
# Header 1

## Header 2

### Header 3

#### Header 4

##### Header 5

###### Header 6
```

## Emphasis
You can emphasize text using asterisks \* or underscores \_.

Italic: _Italic_ or _Italic_
Bold: **Bold** or **Bold**
Bold Italic: **_Bold Italic_** or **_Bold Italic_**

```
Italic: *Italic* or _Italic_
Bold: **Bold** or __Bold__
Bold Italic: ***Bold Italic*** or ___Bold Italic___
```

## Lists

Markdown supports both ordered and unordered lists.

#### Unordered List

```markdown
- Item 1
- Item 2
  - Subitem 1
  - Subitem 2
```

#### Ordered List

```markdown
1. First item
2. Second item
   1. Subitem A
   2. Subitem B
```

## Links
You can create links in Markdown using square brackets [] for the link text and parentheses () for the URL.

[Google](https://www.google.com)

```markdown
[Google](https://www.google.com)
```

## Images

Inserting images is similar to links, but with an exclamation mark ! in front of the square brackets.

![Alternative text](https://ih1.redbubble.net/image.122163944.9824/flat,750x1000,075,f.u1.jpg)

```
![Alternative text](https://ih1.redbubble.net/image.122163944.9824/flat,750x1000,075,f.u1.jpg)
```

## Blockquotes

Blockquotes are created using the > symbol. You can also nest blockquotes.

> This is a blockquote.
>
> > Nested blockquote.
> > Code
> > Inline code can be enclosed in backticks `code`.

```
> This is a blockquote.
>
> > Nested blockquote.
> > Code
> > Inline code can be enclosed in backticks `code`.
```

For code blocks, use triple backticks with the language name (optional) for syntax highlighting.

```javascript
const example = "Hello, World!";
console.log(example);
```

```
const example = "Hello, World!";
console.log(example);
```

## Horizontal Rules

You can create horizontal rules using three or more hyphens ---, asterisks \*\*\*, or underscores \_\_\_.

---

```
---
```

## Tables
Markdown supports creating tables with columns and rows. Use pipe | to separate columns and hyphens for the header row.

| Header 1 | Header 2 |
| -------- | -------- |
| Data 1   | Data 2   |

```
| Header 1 | Header 2 |
|----------|----------|
| Data 1   | Data 2   |
```
