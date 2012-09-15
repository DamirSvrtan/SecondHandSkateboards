module ApplicationHelper

def full_title(page_title)
	base_title = "Broken Skateboards"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

def add_zeros(id)
	if id<10
		"00"+id.to_s
	else if id>=10 && id<100
		"0"+id.to_s
	else 
		id.to_s
	end
    end
end

def hrjezik(recenica)
   array=recenica.split(/ /)
   hrvatski = Array.new
   hrvatski << "Polje"
   array.each do |word|
       case
	when word == "is"
		hrvatski << "je"
	when word == "short"
		hrvatski << "prekratko"
	when word == "long" 
		hrvatski << "predugo"
	when word == "too"
	when word == "digest"
	when word == "(minimum"
		hrvatski << "(minimum"
	when word == "(maximum"
		hrvatski << "(maksimum"
	when word == "characters)"
		if hrvatski[-1] == "3"
		hrvatski[-2] = "su"
		hrvatski << "znaka"
		else
		hrvatski << "znakova)"
		end
        when word == "can't"
      		 hrvatski << "ne smije"
       	when word == "be"
      		 hrvatski << "biti"
        when word == "blank"
       		hrvatski << "prazno"
	when word == "Password"
		hrvatski << "lozinka"
	when word == "invalid"
		hrvatski << "krivog tipa"
	when word == "Name"
		hrvatski << "nadimak"
	when word == "Email"
		hrvatski << "e-mail"
	when word == "Phone"
		hrvatski << "telefonski"
	when word == "number"
		hrvatski << "broj"
	when word == "County"
		hrvatski << "zupanija"
	when word == "Koristenost"
		hrvatski << "stanje"
	when word == "confirmation"
		hrvatski[-1] = "ponovni unos lozinke"
        else 
         	hrvatski << word.downcase
        end
   end
   
   return hrvatski.join(" ")

end


end
