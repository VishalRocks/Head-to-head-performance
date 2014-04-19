class Prediction < ActiveRecord::Base
	validates_numericality_of :rating1
	validates_numericality_of :rating2
	validates_numericality_of :volatility1
	validates_numericality_of :volatility2

end
