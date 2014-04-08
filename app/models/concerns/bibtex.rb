module Bibtex
  extend ActiveSupport::Concern

  def random_key()
    string = rand(36**5).to_s(36)
    while Reference.find_by_key(string).nil? == false
      string = rand(36**5).to_s(36)
    end
    return string
  end

  def generate_bibtex()
    bibtex = "@" + reference_type + "{"
    if key == ""
      bibtex += special_chars(random_key()) + ",\n"
    else
      bibtex += special_chars(key) + ",\n"
    end
    bibtex += "author = {"
    authors.each_with_index do |author, index|
      if (index+1 == authors.length)
        bibtex += special_chars(author.name) + "},\n"
      else
        bibtex += special_chars(author.name) + "and"
      end
    end
    attributes.each_pair do |name, value|
    unless name == "id" or name == "reference_type" or name == "key" or name == "updated_at" or name == "created_at" or value.nil? or value == ""
      if name.include? "_id"
        if name.include? "journal"
          bibtex += "journal = {" + special_chars(journal.name) + "},\n"
        elsif name.include? "publisher"
          bibtex += "publisher = {" + special_chars(publisher.name) + "},\n"
        elsif name.include? "series"
          bibtex += "series = {" + special_chars(series.name) + "},\n"
        elsif name.include? "organization"
          bibtex += "organization = {" + special_chars(organization.name) + "},\n"
        end
      else
        bibtex += name + " = {" + special_chars(value.to_s) + "},\n"
      end
     end
   end
   bibtex += "}"
   return bibtex
  end

  def special_chars(string)
    string = string.gsub(/[åäöÅÄÖ]/, 'å' => '\aa', 'ä' => '\"{a}', 'ö' => '\"{o}', 'Å' => '\AA', 'Ä' => '\"{A}', 'Ö' => '\"{O}')
  end
end
