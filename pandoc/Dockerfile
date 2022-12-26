FROM pandoc/latex

# install additional packages
RUN tlmgr install adjustbox enumitem koma-script mdframed needspace titlesec xecjk zref

# install plantuml
RUN apk add plantuml graphviz

# copy filters for plantuml
RUN mkdir -p /usr/share/pandoc/filters
COPY diagram-generator.lua /usr/share/pandoc/filters

# enable plantuml by default
ENTRYPOINT ["/usr/local/bin/pandoc", "--lua-filter=/usr/share/pandoc/filters/diagram-generator.lua", "--metadata=plantumlPath:/usr/share/java/plantuml.jar"]
