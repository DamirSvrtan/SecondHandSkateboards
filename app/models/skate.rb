class Skate < ActiveRecord::Base
attr_accessible :koristenost, :daska_marka, :daska_sirina, :osovine_marka, :osovine_sirina, :kotaci_marka, :kotaci_radijus, :sa_gripom, :cijena, :dodatan_opis, :slika, :naslov, :starost, :zamjena

has_attached_file :slika, :styles => { :medium => "300x300>", :thumb => "100x100>" }

belongs_to :user

validates :naslov, presence: true
validates :koristenost, presence: true
validates :daska_marka, presence: true
validates :daska_sirina, presence: true
validates :osovine_marka, presence: true
validates :osovine_sirina, presence: true
validates :kotaci_marka, presence: true
validates :kotaci_radijus, presence: true
validates :sa_gripom, presence: true
validates :cijena, presence: true
validates :user_id, presence: true
validates :dodatan_opis, :length => { :maximum => 500 }

#default_scope order: 'wheels.created_at DESC'
end
