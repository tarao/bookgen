extensions=(
    bracketed_spans
    fancy_lists
    fenced_code_attributes
    fenced_code_blocks
    fenced_divs
    header_attributes
    tex_math_dollars
    yaml_metadata_block
)
EXTENSIONS=$(IFS=+; echo "${extensions[*]}")

MARKDOWN_OUTPUT=dist/book.md
OUTPUT=dist/book.html

PORT=8142
