module ApplicationHelper


  def init_or_find_authors(authors_attributes)
    # parseaa :names attribuutista authorit, tee array jossa on authorit joka loydettyna db:sta tai initialisoituina
  	if authors_attributes[:names].nil?
        return
    end
    authors = authors_attributes[:names].split(', ')
    array = Array.new
    authors.each do |a|
      author = author(a)
      array.push author
    end
  end

  def save_authors(authors)
    # kay lapi arrayn authorit ja tee kaikille author.save
    authors.each do |a|
    	author = author(a)
    	author.save
    end
  end

  def create_reference_author_links(reference, authors)
    # luo reference_authors liitostauluun rivit jossa reference-authors_arrayn_author
    authors.each do |a|
    	author = author(a)
    	reference.authors << author
    end
  end

  private

  def author(name)
  	author = Author.where("lower(name) = ?", name.downcase).first
  	if author.nil?
  		author = Author.create name:name
  	end
  	author
  end

end
