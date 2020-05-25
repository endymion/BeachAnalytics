# Convert DOIs to html. This *will not match all DOIs*. The regex comes from
# https://www.crossref.org/blog/dois-and-matching-regular-expressions/
# this may conflict with some CSLs that insert `https://doi.org/` or the like.

module Jekyll
  class Scholar
    class DOILinks < BibTeX::Filter
      DOI_FILTER = Regexp.new("^10\\.\\d{4,9}/[-._;()/:A-Z0-9]+$", Regexp::IGNORECASE)
      def apply(value)
        value.to_s.gsub(DOI_FILTER) {
          "<a href=\"https://doi.org/#{$&}\">#{$&}</a>"
        }
      end
    end
  end
end
