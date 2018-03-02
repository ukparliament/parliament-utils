module Parliament
  module Utils
    module Helpers
      module FormatHelper
        DATA_FORMATS = %w(
            application/n-triples
            text/turtle
            application/sparql-results+xml
            application/sparql-results+json
            text/csv
            text/tab-separated-values
            text/vnd.graphviz
            application/rdf+xml
            application/xml
            application/json+ld
            application/json
        ).freeze
        end
      end
    end
  end
