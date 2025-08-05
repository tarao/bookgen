shopt -s globstar

echo -e "Source directory:\n	${BOOKGEN_SOURCE_DIR:=${BOOKGEN_ROOT}/src}"

echo -e "Include directory:\n	${BOOKGEN_INCLUDE_DIR:=${BOOKGEN_ROOT}/includes}"
BOOKGEN_INCLUDE_HTML=()
for f in "${BOOKGEN_INCLUDE_DIR}"/*.html; do
    BOOKGEN_INCLUDE_HTML+=("$f")
done
BOOKGEN_INCLUDE_CSS=()
for f in "${BOOKGEN_INCLUDE_DIR}"/*.css; do
    BOOKGEN_INCLUDE_CSS+=("$f")
done

BOOKGEN_METADATA="${BOOKGEN_SOURCE_DIR}/metadata.yaml"
echo -e "Metadata:\n	${BOOKGEN_METADATA}"

default_extensions=(
    bracketed_spans
    definition_lists
    fancy_lists
    fenced_code_attributes
    fenced_code_blocks
    fenced_divs
    header_attributes
    markdown_in_html_blocks
    tex_math_dollars
    tex_math_single_backslash
    yaml_metadata_block
)
echo -e "Extensions:\n	${BOOKGEN_EXTENSIONS:=$(IFS=+; echo "${default_extensions[*]}")}"

echo -e "Highlight style:\n	${BOOKGEN_HIGHLIGHT_STYLE:=zenburn}"

echo -e "Output directory:\n	${BOOKGEN_OUTPUT_DIR:=${BOOKGEN_ROOT}/dist}"
mkdir -p "${BOOKGEN_OUTPUT_DIR}"
echo -e "Markdown output:\n	${BOOKGEN_OUTPUT_MARKDOWN:=${BOOKGEN_OUTPUT_DIR}/book.md}"
echo -e "HTML output:\n	${BOOKGEN_OUTPUT_HTML:=${BOOKGEN_OUTPUT_DIR}/book.html}"

echo -e "Preview port:\n	${BOOKGEN_PREVIEW_PORT:=8142}"

## in docker container

DOCKER_SOURCE=()
for f in "${BOOKGEN_SOURCE_DIR}"/**/*.md; do
    f="${f#${BOOKGEN_SOURCE_DIR}}"
    DOCKER_SOURCE+=("src/${f#/}")
done

DOCKER_INCLUDE_HTML=()
for f in "${BOOKGEN_INCLUDE_HTML[@]}"; do
    f="${f#${BOOKGEN_INCLUDE_DIR}}"
    DOCKER_INCLUDE_HTML+=("includes/${f#/}")
done
DOCKER_INCLUDE_CSS=()
for f in "${BOOKGEN_INCLUDE_CSS[@]}"; do
    f="${f#${BOOKGEN_INCLUDE_DIR}}"
    DOCKER_INCLUDE_CSS+=("includes/${f#/}")
done

DOCKER_OUTPUT_MARKDOWN="${BOOKGEN_OUTPUT_MARKDOWN#${BOOKGEN_OUTPUT_DIR}}"
DOCKER_OUTPUT_MARKDOWN="dist/${DOCKER_OUTPUT_MARKDOWN#/}"
DOCKER_OUTPUT_HTML="${BOOKGEN_OUTPUT_HTML#${BOOKGEN_OUTPUT_DIR}}"
DOCKER_OUTPUT_HTML="dist/${DOCKER_OUTPUT_HTML#/}"
