# pandoc

[Pandoc](https://pandoc.org) with [plantuml](https://plantuml.com) support and some additional packages.

## usage

```shell
docker run --rm \
    --volume "$(pwd):/data" \
    --user $(id -u):$(id -g) \
    keeword/pandoc \
        --pdf-engine=xelatex \
        --from=markdown \
        --embed-resources \
        --standalone \
        --template="template.latex" \
        --listings \
        -o doc.pdf \
        doc.md
```

See more detail on the [pandoc official docker image](https://hub.docker.com/r/pandoc/latex).
