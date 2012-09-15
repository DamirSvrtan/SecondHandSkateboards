class Truck < ActiveRecord::Base
attr_accessible :marka, :sirina1, :sirina2, :visina, :koristenost, :starost, :zamjena, :cijena, :dodatan_opis, :slika

has_attached_file :slika, :styles => { :medium => "300x300>", :thumb => "100x100>" }

belongs_to :user

validates :marka, presence: true
validates :sirina1, presence: true
validates :sirina2, presence: true
validates :visina, presence: true
validates :koristenost, presence: true
validates :starost, presence: true
validates :cijena, presence: true
validates :user_id, presence: true
validates :dodatan_opis, :length => { :maximum => 500 }

#default_scope order: 'wheels.created_at DESC'
end
