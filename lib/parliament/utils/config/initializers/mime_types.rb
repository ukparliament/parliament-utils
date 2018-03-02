# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

Mime::Type.register 'application/n-triples', :nt
Mime::Type.register 'text/turtle', :ttl
Mime::Type.register 'application/sparql-results+xml', :srx
Mime::Type.register 'application/sparql-results+json', :srj
Mime::Type.register 'text/tab-separated-values', :tsv
Mime::Type.register 'text/vnd.graphviz', :gv, [], [:dot]
Mime::Type.register 'application/rdf+xml', :rdf, [], [:rdfxml]
Mime::Type.register 'application/rdf+ld', :jsonld

