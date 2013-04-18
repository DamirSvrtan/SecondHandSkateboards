class ClothingOstalo < ActiveRecord::Base
attr_accessible :naslov, :opis, :cijena, :slika, :zamjena

has_attached_file :slika, :styles => { :medium => "300x300>", :thumb => "100x100>" }

belongs_to :user

validates :naslov, presence: true
validates :opis, presence: true
validates :cijena, presence: true
validates :user_id, presence: true

#default_scope order: 'wheels.created_at DESC'
end
