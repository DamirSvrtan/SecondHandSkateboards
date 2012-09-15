class Shoe < ActiveRecord::Base
attr_accessible :naslov, :marka, :velicina, :koristenost, :starost, :zamjena, :cijena, :dodatan_opis, :slika

has_attached_file :slika, :styles => { :medium => "300x300>", :thumb => "100x100>" }

belongs_to :user

validates :naslov, presence:true
validates :marka, presence: true
validates :velicina, presence: true
validates :koristenost, presence: true
validates :starost, presence: true
validates :cijena, presence: true
validates :user_id, presence: true
validates :dodatan_opis, :length => { :maximum => 500 }

#default_scope order: 'wheels.created_at DESC'
end
