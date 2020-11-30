class Speech < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Noun' },
    { id: 3, name: 'Verb' },
    { id: 4, name: 'Preposition' },
    { id: 5, name: 'Conjunction' },
    { id: 6, name: 'Adjective' },
    { id: 7, name: 'Adverb' },
    { id: 8, name: 'Determiner' },
    { id: 9, name: 'Pronoun' },
    { id: 10, name: 'Other' }
  ]
  include ActiveHash::Associations
  has_many :dictionaries
end

