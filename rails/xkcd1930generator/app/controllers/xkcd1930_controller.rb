class Part
	def initialize(choice=nil, prefix=nil, suffix=nil)
		@prefix=prefix
		@choice=choice
		@suffix=suffix
	end

	def to_s()
		str="#{@prefix.to_s} #{@choice.sample.to_s unless @choice.nil?} #{@suffix.to_s}"
	end
end

class Xkcd1930Controller < ApplicationController
  def calendar
  	# Calendar fact generator, see https://xkcd.com/1930/
	#First part of the sentence
	p1 = Part.new(["harvest","super","blood"], "the", "moon")
	p2 = Part.new([Part.new(["winter","summer"], "the").to_s+Part.new(["solstice","olympics"]).to_s])
	p3 = Part.new([Part.new(["earliest","latest"], "the").to_s+Part.new(["sunrise","sunset"]).to_s])
	p4 = Part.new(["saving","savings"], "daylight", "time")
	p5 = Part.new(["day","year"], "leap")
	p6 = Part.new(["easter"])
	p7 = Part.new(["toyota truck month"])
	p8 = Part.new(["shark week"])
	p_first = Part.new([p1,p2,p3,p4,p5,p6,p7,p8], "Did you know that")

	#Second part of the sentence
	p9 = Part.new(["earlier","later","at the wrong time"], "happens", "every year")
	p10 = Part.new(["sun", "moon", "zodiac",  Part.new(["gregorian", "mayan", "lunar", "iPhone"], nil, "calendar").to_s, "atomic clock in Colorado"], "drifts out of the sync with the")
	p11 = Part.new(["not happen","happen twice"], "might", "this year")
	p_second = Part.new([p9, p10, p11])

	#Third part of the sentence
	p12  = Part.new(["Indiana", "Arizona", "Russia"], "time zone legislation in")
	p13 = Part.new(["a decree  by the pope in the 1500s", "magnatic field reversal"])
	p14 = Part.new(["Benjamin Franklyn","Isaac Newton","FDR"], "an arbitrary  decision by")
	p15 = Part.new(["Mason-Dixon","International date"], "", "line")
	p16 = Part.new(["moon","sun","earth's axis","equator","prime  meridian",p15.to_s], "of the")
	p17 = Part.new(["precession","libration","nutation","libation","eccentricity","obliquity"],nil,p16.to_s)
	p_third = Part.new([p12,p13,p14,p17], "because of")

	#Fourth part of the sentence
	p18 = Part.new(["it causes a predictable increase in car accidents","that's why wehave leap seconds.","scientists are really worried.", "it's getting worse and no one knows why,"])
	p19 = Part.new(["bronze age","ice age","cretaceous","1990s"], "it was even more extreme during the")
	p20 = Part.new(["will never happen","actually makes things worse","is stalled in congress","might be unconstitutional"], "there's a proposal to fix it, but it")
	p_fourth = Part.new([p18,p19,p20], "Apparently")

	#p = Part.new(["","",""], "", "")
	p_complete = p_first.to_s + p_second.to_s + p_third.to_s + "?\n" + p_fourth.to_s + "."
	@sentence = p_complete.to_s.gsub(/\s+/, ' ').gsub(/\s\./, '.').gsub(/\s\?/, '?')
  end
end
