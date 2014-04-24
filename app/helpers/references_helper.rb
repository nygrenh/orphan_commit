module ReferencesHelper
    include ApplicationHelper

    def create_attribute_object_hash(reference_params)
        attributes = Hash.new

        init_author_objects(reference_params, attributes, :authors)
        init_author_objects(reference_params, attributes, :editors)

        init_object(reference_params, attributes, :journal)
        init_object(reference_params, attributes, :publisher)
        init_object(reference_params, attributes, :series)
        init_object(reference_params, attributes, :organization)
        attributes
    end

    def init_object(params, attributes, symbol)
        return unless params[symbol]
        name = params[symbol]['name'] || params[symbol]
        unless name.blank?
            table = eval(symbol.to_s.titlecase)
            attributes.update(symbol => table.find_or_initialize_by(name: name))
        end
    end

    def init_author_objects(reference_params, attributes, symbol)
      authors_attributes = reference_params[symbol]
      unless authors_attributes.blank?
        attributes.update(symbol => init_or_find_authors_or_editors(authors_attributes)) 
      end
    end


    def connect_attributes_to_reference(reference, attributes)
      reference.publisher = attributes[:publisher]
      reference.journal = attributes[:journal]
      reference.series = attributes[:series]
      reference.organization = attributes[:organization]
      reference.authors_present = attributes[:authors].present?
      reference.editors_present = attributes[:editors].present?
    end

    def create_author_and_editor_links(reference, attributes)
      create_authors(reference, attributes)
      create_editors(reference, attributes)
    end

    def create_authors(reference, attributes)
      if reference.authors_present
        save_authors_or_editors(attributes[:authors])
        create_reference_author_links(@reference, attributes[:authors])
      end
    end

    def create_editors(reference, attributes)
        if reference.editors_present
          save_authors_or_editors(attributes[:editors])
          create_reference_editor_links(@reference, attributes[:editors])
        end 
    end

end
