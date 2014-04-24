module ReferencesHelper
	include ApplicationHelper

	def create_attribute_object_hash(reference_params)
		attributes = Hash.new

		init_journal_object(reference_params, attributes)
		init_publisher_object(reference_params, attributes)
		init_series_object(reference_params, attributes)
		init_organization_object(reference_params, attributes)
		init_author_objects(reference_params, attributes)
		init_editor_objects(reference_params, attributes)

		return attributes
	end


	def init_journal_object(reference_params, attributes)
	    if not reference_params[:journal].blank? || reference_params[:journal][:name].blank?
	    	journal_attributes = reference_params[:journal]
	        attributes.update(journal: Journal.find_or_initialize_by(name: journal_attributes[:name]))
	    end
	end

	def init_publisher_object(reference_params, attributes)
	    if not reference_params[:publisher].blank? || reference_params[:publisher][:name].blank?
	      	publisher_attributes = reference_params[:publisher]
	        attributes.update(publisher: Publisher.find_or_initialize_by(name: publisher_attributes[:name]))
	    end
	end

	def init_series_object(reference_params, attributes)
		if not reference_params[:series].blank?
      		attributes.update(series: Series.find_or_initialize_by(name: reference_params[:series]))
    	end
	end

	def init_organization_object(reference_params, attributes)
	    if not reference_params[:organization].blank?
      		attributes.update(organization: Organization.find_or_initialize_by(name: reference_params[:organization]))
   		end
	end

	def init_author_objects(reference_params, attributes)
		authors_attributes = reference_params[:authors]
	    if not authors_attributes.blank?
	      attributes.update(authors: init_or_find_authors_or_editors(authors_attributes)) #metodin runko on helpers/application_helper -tiedostossa
	    end
	end

	def init_editor_objects(reference_params, attributes)
	    editors_attributes = reference_params[:editors]
	    if not editors_attributes.blank?
	      attributes.update(editors: init_or_find_authors_or_editors(editors_attributes)) #authors ja editors samassa taulussa
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
