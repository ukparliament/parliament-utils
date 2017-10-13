module Parliament
  module Utils
    module Helpers
      module FormatHelper
        DATA_FORMATS = %w(
            application/n-triples
            text/turtle
            text/n3
            application/n-quads
            application/x-trig
            application/trix
            application/sparql-results+xml
            application/sparql-results+json
            application/rdf+xml
            application/json
            text/csv
            text/tab-separated-values
            text/vnd.graphviz
        ).freeze
        end
      end
    end
  end
