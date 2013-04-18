class Deck < ActiveRecord::Base
attr_accessible :marka, :sirina_daske, :sa_gripom, :koristenost, :starost, :zamjena, :cijena, :dodatan_opis, :slika, :naslov

has_attached_file :slika, :styles => { :medium => "300x300>", :thumb => "100x100>" }

belongs_to :user

validates :naslov, presence: true
validates :marka, presence: true
validates :sirina_daske, presence: true
validates :koristenost, presence: true
validates :starost, presence: true
validates :cijena, presence: true, :numericality => { :only_integer => true }
validates :user_id, presence: true
validates :dodatan_opis, :length => { :maximum => 500 }

#default_scope order: 'decks.created_at DESC'
end
