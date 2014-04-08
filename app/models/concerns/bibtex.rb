module Bibtex
  extend ActiveSupport::Concern

  def generate_bibtex()
    bibtex = "@" + reference_type + "{"
    if key == ""
      bibtex += "\n"
    else
      bibtex += key + ",\n"
    end
    bibtex += "author = {"
    authors.each_with_index do |author, index|
      if (index+1 == authors.length)
        bibtex += author.name + "},\n"
      else
        bibtex += author.name + "and"
      end
    end
    attributes.each_pair do |name, value|
    unless name == "id" or name == "reference_type" or name == "key" or name == "updated_at" or name == "created_at" or value.nil? or value == ""
      if name.include? "_id"
        if name.include? "journal"
          bibtex += "journal = {" + journal.name + "},\n"
        elsif name.include? "publisher"
          bibtex += "publisher = {" + publisher.name + "},\n"
        elsif name.include? "series"
          bibtex += "series = {" + series.name + "},\n"
        elsif name.include? "organization"
          bibtex += "organization = {" + organization.name + "},\n"
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
