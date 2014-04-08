module Bibtex
  extend ActiveSupport::Concern

  def generate_bibtex(reference)
    bibtex = "@" + reference.reference_type + "{"
    if reference.key == ""
      bibtex += "\n"
    else
      bibtex += reference.key + ",\n"
    end
    authors = reference.authors
    bibtex += "author = {"
    authors.each_with_index do |author, index|
      if (index+1 == authors.length)
        bibtex += author.name + "},\n"
      else
        bibtex += author.name + "and"
      end
    end
    attributes = reference.attributes
    attributes.each_pair do |name, value|
    unless name == "id" or name == "reference_type" or name == "key" or name == "updated_at" or name == "created_at" or value.nil? or value == ""
      if name.include? "_id"
        if name.include? "journal"
          bibtex += "journal = {" + reference.journal.name + "},\n"
        elsif name.include? "publisher"
          bibtex += "publisher = {" + reference.publisher.name + "},\n"
        elsif name.include? "series"
          bibtex += "series = {" + reference.series.name + "},\n"
        elsif name.include? "organization"
          bibtex += "organization = {" + reference.organization.name + "},\n"
        end
      else
        bibtex += name + " = {" + value.to_s + "},\n"
      end
     end
   end
   bibtex += "}"
   return bibtex
  end

end
