FactoryGirl.define do

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
    author :author2
    journal
  end

  factory :article3, class: Article do
    title "Intro to Intros"
    year 1993
    volume 5
    number 3
    key "PK"
    pages "2-5"
    author :author3
    journal
  end

  factory :article4, class: Article do
    title "Ruby on Rails basics"
    year 2005
    volume 5
    number 3
    key "PK"
    pages "2-5"
    author :author4
    journal
  end

  factory :author do
    name "Pekka"
  end

  factory :author2 do
    name "Asd Asdington"
  end

  factory :author3 do
    name "Herlock Sholmes"
  end  

  factory :author4 do
    name "David Heinemeier Hansson"
  end  

  factory :journal do
    name "Unscientific American"
  end

end