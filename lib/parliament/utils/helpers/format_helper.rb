module Parliament
  module Utils
    module Helpers
      module FormatHelper
        DATA_FORMATS = {
            'application/n-triples' => 'nt',
            'text/turtle' => 'ttl',
            'text/n3' => 'n3',
            'application/n-quads' => 'nq',
            'application/x-trig' => 'trig',
            'application/trix' => 'xml',
            'application/sparql-results+xml' => 'srx',
            'application/sparql-results+json' => 'srj',
            'application/rdf+xml' => 'rdf',
            'application/json' => 'rj',
            'text/csv' => 'csv',
            'text/tab-separated-values' => 'tsv',
            'text/html' => 'html',
            'text/vnd.graphviz' => 'gv'
        }.freeze
        end
      end
    end
  end
