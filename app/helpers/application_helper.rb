module ApplicationHelper


  def init_or_find_authors(authors_attributes)
    # parseaa :names attribuutista authorit, tee array jossa on authorit joka loydettyna db:sta tai initialisoituina
  end

  def save_authors(authors)
    # kay lapi arrayn authorit ja tee kaikille author.save
  end

  def create_reference_author_links(reference, authors)
    # luo reference_authors liitostauluun rivit jossa reference-authors_arrayn_author
  end

end
