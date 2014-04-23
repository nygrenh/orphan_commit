module ApplicationHelper


  def init_or_find_authors_or_editors(authors_attributes) #refactoraa nimeamiset "people"
    # parseaa :names attribuutista authorit, tee array jossa on authorit joka loydettyna db:sta tai initialisoituina
    if authors_attributes[:names].nil?
      return
    end
    authors = authors_attributes[:names].split(' and ')
    array = Array.new
    authors.each do |a|
      author = author(a)
      array.push author
    end
    return array
  end

  def save_authors_or_editors(authors) #refactoraa nimeamiset "people"
    # kay lapi arrayn authorit ja tee kaikille author.save

    authors.each do |a|
      a.save #authorit on jo taulussa objekteina?
    end
  end

  def create_reference_author_links(reference, authors)
    # luo reference_authors liitostauluun rivit jossa reference-authors_arrayn_author
    authors.each do |a|
      ReferenceAuthor.create(reference_id: reference.id, author_id: a.id)
    end
  end

  def create_reference_editor_links(reference, editors)
    # luo reference_authors liitostauluun rivit jossa reference-authors_arrayn_author
    editors.each do |e|
      ReferenceEditor.create(reference_id: reference.id, author_id: e.id)
    end
  end

  private

  def author(name) #refactoraa nimeamiset "people"
    author = Author.where("lower(name) = ?", name.downcase).first
    if author.nil?
      author = Author.new name: name
    end
    author
  end

end
