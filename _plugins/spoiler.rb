module Jekyll
  module Tags
    class Solution < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
        @markup = markup
      end

      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))

        "<details>" +
          "<summary>Solution</summary>" +
           output +
        "</details>"

      end
    end
  end
end

Liquid::Template.register_tag('solution', Jekyll::Tags::Solution)
