
----

----

Author Notes {-}
============

[Remove this chapter before publish]{.todo}

Original Notations {-}
------------------

### TODO Notaion {-}

[Something to do]{.todo}

### NOTE Notation {-}

[Some notes (not for publication, of course)]{.note}

### WARNING Notation {-}

::: warning
Something you have to care about
:::

Pandoc Markdown {-}
---------------

- [Pandoc's Markdown - Pandoc User’s Guide](https://pandoc.org/MANUAL.html#pandocs-markdown)

### Annotation {-}

Annotated text[^annot].

[^annot]: Annotating text

Code {-}
----

- [codebraid](https://github.com/gpoore/codebraid/)
- [example](https://htmlpreview.github.io/?https://github.com/gpoore/codebraid/blob/master/examples/python.html)

### Python code with output {-}

```{.python .cb-run session=cheat_sheet show=code+stdout}
print(1 + 2)
```

### Python code with caption {-}

::: code-caption
Some caption
:::
```{.python .cb-run session=cheat_sheet show=code+stdout}
print(1 + 2)
```

### Python code (without run) {-}

```{.python .cb-code}
print(1 + 2)
```

### Python code (run without output) {-}

```{.python .cb-code show=code}
print(1 + 2)
```

### Python output as embeded text (without code) {-}

```{.python .cb-run session=cheat_sheet_no_code}
print(1 + 2)
```

### Python code output (without code) {-}

```{.python .cb-run session=cheat_sheet_no_code show=stdout}
print(1 + 2)
```


Math {-}
----

### Inline {-}

$\sum^N_{k=1} k^2$

::: warning
Don't put space between `$` and TeX notation
:::

### Block {-}

$$
\sum^N_{k=1} k^2
$$
