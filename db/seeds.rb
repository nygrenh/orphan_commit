# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

article = ReferenceType.create name:'article'
book = ReferenceType.create name:'book'
inproceedings = ReferenceType.create name:'inproceedings'
#
#author = Author.create name:'Bob'
#author2 = Author.create name:'John'
#
#journal = Journal.create name:'FUTURE TECH WEEKLY'
#publisher = Publisher.create name:'FUTURE TECH CO.'
#
#
#ref = Reference.create reference_type:article, journal:journal, publisher:publisher,
#                         title:'Teleporting', year:2014, volume:1, number:20,
#                         pages:'123-321', month:3, note:'cool stuff', address:'moon university street'
#
#
#ref_author = ReferenceAuthor.create author:author, reference:ref
#ref_author2 = ReferenceAuthor.create author:author2, reference:ref
