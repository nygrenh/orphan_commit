FactoryGirl.define do

  factory :reference_article, class: Reference do
    reference_type "Article"
    title "Ruby on Rails basics"
    association :journal, factory: :journal
    year 2005
    ignore do
        authors_count 1
    end
    before(:create) do |reference, evaluator|
        reference.authors << FactoryGirl.create_list(:author, evaluator.authors_count)
    end
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

  factory :reference_editor do
    author_id 1
    reference_id 1
  end

  factory :reference_author, class: ReferenceAuthor do
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
    ignore do
        authors_count 1
    end
    before(:create) do |reference, evaluator|
        reference.authors << FactoryGirl.create_list(:author, evaluator.authors_count)
    end
  end

  factory :reference_inproceedings, class: Reference do
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
    reference_type "Inproceedings"
    ignore do
        authors_count 1
    end
    before(:create) do |reference, evaluator|
        reference.authors << FactoryGirl.create_list(:author, evaluator.authors_count)
    end
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