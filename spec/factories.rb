FactoryGirl.define do

  factory :reference_article, class: Reference do
    reference_type "Article"
    title "Ruby on Rails basics"
    association :journal, factory: :journal
    year 2005

  end

  factory :reference_article2, class: Reference do
    reference_type "Article"
    title "Intro to Intros"
    association :journal, factory: :journal
    year 1993
  end

  factory :reference_article3, class: Reference do
    reference_type "Article"
    title "How to asd"
    association :journal, factory: :journal
    year 2004
  end

  factory :reference_author, class: ReferenceAuthor do
    author_id 1
    reference_id 1
  end

  factory :reference_editor do
    author_id 1
    reference_id 1
  end

  factory :reference_book, class: Reference do
    title "Testi"
    year 2014
    volume 205
    edition "1."
    number 4
    series_id 1
    month 4
    note "Testinote"
    address "Osoite 1"
    key "Avain1"
    association :publisher, factory: :publisher
    reference_type "Book"
  end

  factory :reference_inproceeding, class: Reference do
    title "Testi"
    year 2014
    volume 205
    number 4
    series_id 1
    organization_id 4
    month 4
    note "Testinote"
    pages "125--587"
    address "Osoite 1"
    booktitle "Otsikko"
    key "Avain1"
    association :publisher, factory: :publisher
    reference_type "Inproceeding"
  end

  factory :series do
      name "Random kokoelmat"
  end

  factory :organization do
    name "Random kokoelmat"
  end

  factory :journal do
    name "Random kokoelmat"
  end

  factory :publisher do
    name "Random kokoelmat"
  end

  factory :article do
    title "Pekan kuvakirja"
    year 2013
    volume 5
    number 3
    key "PK"
    pages "2-5"
    author
    journal
  end

  factory :article2, class: Article do
    title "How to asd"
    year 2004
    volume 5
    number 3
    key "PK"
    pages "2-5"
    association :author, factory: :author2
    journal
  end

  factory :article3, class: Article do
    title "Intro to Intros"
    year 1993
    volume 5
    number 3
    key "PK"
    pages "2-5"
    association :author, factory: :author3
    journal
  end

  factory :article4, class: Article do
    title "Ruby on Rails basics"
    year 2005
    volume 5
    number 3
    key "PK"
    pages "2-5"
    association :author, factory: :author4
    journal
  end

  factory :author do
    name "Pekka"
  end

  factory :author2, class: Author do
    name "Asd Asdington"
  end

  factory :author3, class: Author do
    name "Herlock Sholmes"
  end

  factory :author4, class: Author do
    name "David Heinemeier Hansson"
  end

  factory :journal2, class: Journal do
    name "Unscientific American"
  end
end