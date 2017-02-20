module Jekyll
  class Scholar

    class BibliographyTagByType < Liquid::Tag
      include Scholar::Utilities


      # Generate the index using csl-index.
      def render_index(item, ref)
        si = '[' + @prefix_defaults[item.type].to_s + @type_counts[item.type].to_s + ']'
        @type_counts[item.type] = @type_counts[item.type].to_i - 1

        idx_html = content_tag "div class=\"csl-index\"", si
        return idx_html + ref
      end

      # Generate the publication type images.
      def render_ref_img(item)
        css_points = Hash[{
                            :article => "csl-point-journal-icon",
                            :inproceedings => "csl-point-conference-icon",
                            :incollection=> "csl-point-bookchapter-icon",
                            :techreport => "csl-point-techreport-icon",
                            :book => "csl-point-book-icon"
                          }]

        s = css_points[item.type]
        return s
      end

      # Look at the defaults for prefixes.
      # TODO: Should move this to defaults.
      def initialize_prefix_defaults()
        @prefix_defaults = Hash[{
                                  :article => "J",
                                  :inproceedings => "C",
                                  :incollection=> "BC",
                                  :techreport => "TR",
                                  :book => "B"
                                }]
      end

      # Generate a link if an ACM PDF link exists.
      def render_acmpdf_link(entry)
        pdflink =""
        if entry.field?(:acmpdflink)
          pdflink = "<div class=\"pure-button csl-pdf\"><a href=\"" + entry.acmpdflink.to_s + "\">PDF</a></div>"
        end

        return pdflink
      end

      # Generate a SLIDES link.
      def repository_slides_link_for(entry, base = base_url)
        links = repository[entry.key + "_slides"]
        url = links['pdf'] || links['pptx']
        return unless url

        File.join(base, url)
      end

      def split_reference(reference)
        puts "## " + reference.to_s
  #      puts "\n"
        if !reference.nil?
          xml = Nokogiri::HTML(reference.to_s)
          puts "====B======"
   #       puts xml.css("div.csl-index")
          xml.css("div.csl-block.csl-title").each do |node|
            puts "==> " + node.text
          end
          puts "====E====="
        end
      end

      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup

        optparse(arguments)
      end

      def initialize_type_labels()
        @type_labels =
          Hash[{ "@article" => "Journal Articles",
                 "@inproceedings" => "Conference and Workshop Papers",
                 "@incollection" => "Book Chapters",
                 "@techreport" => "Technical Reports",
                 "@book" => "Books"
               }]
      end


      def set_type_counts(tc)
        @type_counts = tc
      end

      def render_index(item, ref)
        si = '[' + @prefix_defaults[item.type].to_s + @type_counts.to_s + ']'
        @type_counts = @type_counts - 1

        idx_html = content_tag "div class=\"csl-index\"", si
        return idx_html + ref
      end

      def render_header(y)
        ys = content_tag "h2 class=\"csl-year-header\"", y
        ys = content_tag "div class=\"csl-year-icon\"", ys
      end

      def render(context)
        set_context_to context

        # Only select items that are public.
        items = entries.select { |e| e.public == 'yes' }

        initialize_prefix_defaults()
        initialize_type_labels()
        set_type_counts(items.size())

        if cited_only?
          items =
            if skip_sort?
              cited_references.uniq.map do |key|
              items.detect { |e| e.key == key }
            end
            else entries.select  do |e|
              cited_references.include? e.key
            end
            end
        end

        items = items[offset..max] if limit_entries?

        bibliography = render_header(@type_labels[query])
        bibliography << items.each_with_index.map { |entry, index|
          reference = render_index(entry, bibliography_tag(entry, nil))

          if generate_details?
            reference << link_to(details_link_for(entry), config['details_link'],
                                 :class => config['details_link_class'])
          end

          if entry.field?(:award)
            # TODO: Awkward -- Find position to insert it. Before the last </div>
            ts = content_tag "div class=\"csl-award\"", entry.award.to_s
            reference_position = reference.rindex('</div>')
            if reference_position.nil?
              puts "NILL"
            else
              reference.insert(reference.rindex('</div>'), ts.to_s)
            end
          end

          # Check if there are ACM PDF links
          # Really awkward way of insertion
          reference.insert(reference.rindex('</div>').to_i,render_acmpdf_link(entry))

          # Render links if repository specified
          if repository? && !entry.field?(:acmpdflink)
            if not repository_link_for(entry).nil?
              pdflink = "<div class=\"pure-button csl-pdf\"><a href=\"" + repository_link_for(entry) + "\">PDF</a></div>"
              reference.insert(reference.rindex('</div>'), pdflink.to_s )
            end

            # Check for SLIDES PDF.
            if not repository_link_for(entry).nil?
              link = repository_slides_link_for(entry)
              if link.to_s.include?("_slides")
                pdflink = "<div class=\"pure-button csl-slides\"><a href=\"" + repository_slides_link_for(entry) + "\">SLIDES</a></div>"
                reference.insert(reference.rindex('</div>'), pdflink.to_s )
              end
            end


          end

          content_tag config['bibliography_item_tag'], reference
          content_tag "li class=\"" + render_ref_img(entry) + "\"", reference
        }.join("\n")


        content_tag config['bibliography_list_tag'], bibliography, :class => config['bibliography_class']

      end
    end

  end
end

Liquid::Template.register_tag('bibliography_bytype', Jekyll::Scholar::BibliographyTagByType)
