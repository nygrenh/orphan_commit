# FactoryGirl.define do

#   factory :reference_article, class: Reference do
#     if (ReferenceType.find_by(name: 'article').nil?)
#       reference_type {FactoryGirl.create(:reference_type_article)}
#     else
#       reference_type ReferenceType.find_by(name: 'Article')
#     end
#     #author {FactoryGirl.create(:author4)}
#     title "Ruby on Rails basics"
#     journal {FactoryGirl.create(:journal)}
#     year 2005
#   end

#   factory :reference_article2, class: Reference do
#     if (ReferenceType.find_by(name: 'article').nil?)
#       reference_type {FactoryGirl.create(:reference_type_article)}
#     else
#       reference_type ReferenceType.find_by(name: 'Article')
#     end
#     #author {FactoryGirl.create(:author3)}
#     title "Intro to Intros"
#     journal {FactoryGirl.create(:journal)}
#     year 1993
#   end

#   factory :reference_article3, class: Reference do
#     if (ReferenceType.find_by(name: 'article').nil?)
#       reference_type {FactoryGirl.create(:reference_type_article)}
#     else
#       reference_type ReferenceType.find_by(name: 'Article')
#     end
#     #author {FactoryGirl.create(:author2)}
#     title "How to asd"
#     journal {FactoryGirl.create(:journal)}
#     year 2004
#   end

#   factory :reference_author, class: ReferenceAuthor do
#     author_id 1
#     reference_id 1
#   end

#   factory :journal do
#     name "Random kokoelmat"
#   end

#   factory :reference_type_article, class: ReferenceType do
#     name "Article"
#   end

#   factory :reference_type_book, class: ReferenceType do
#     name "Book"
#   end

#   factory :reference_type_inproceedings, class: ReferenceType do
#     name "Inproceedings"
#   end

#   factory :article do
#     title "Pekan kuvakirja"
#     year 2013
#     volume 5
#     number 3
#     key "PK"
#     pages "2-5"
#     author
#     journal
#   end

#   factory :article2, class: Article do
#     title "How to asd"
#     year 2004
#     volume 5
#     number 3
#     key "PK"
#     pages "2-5"
#     author :author2
#     journal
#   end

#   factory :article3, class: Article do
#     title "Intro to Intros"
#     year 1993
#     volume 5
#     number 3
#     key "PK"
#     pages "2-5"
#     author :author3
#     journal
#   end

#   factory :article4, class: Article do
#     title "Ruby on Rails basics"
#     year 2005
#     volume 5
#     number 3
#     key "PK"
#     pages "2-5"
#     author :author4
#     journal
#   end

#   factory :author do
#     name "Pekka"
#   end

#   factory :author2, class: Author do
#     name "Asd Asdington"
#   end

#   factory :author3, class: Author do
#     name "Herlock Sholmes"
#   end  

#   factory :author4, class: Author do
#     name "David Heinemeier Hansson"
#   end  

#   factory :journal2, class: Journal do
#     name "Unscientific American"
#   end

# end