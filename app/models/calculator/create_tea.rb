class Calculator::CreateTea < Calculator
  # FRUIT #
  #preference :max_cb, :integer, :default => 8
  preference :appel, :decimal
  preference :ananas, :decimal
  preference :papaya, :decimal
  preference :zonneroosjes, :decimal
  preference :sinaasappelschillen, :decimal
  preference :brandnetel, :decimal
  preference :ginkgo, :decimal
  preference :lemongrass, :decimal
  preference :nanamint, :decimal
  preference :sagebladeren, :decimal
  # KRUIDEN #
  preference :maretak, :decimal
  preference :karwij, :decimal
  preference :venkel, :decimal
  preference :groenehaver, :decimal
  preference :hibiscusbloesem, :decimal
  preference :anijszaad, :decimal
  preference :kamille, :decimal
  # SPECERIJEN #
  preference :bamboobladeren, :decimal
  preference :rozenbladeren, :decimal
  preference :pepermuntblad, :decimal
  
 # preference :min_amount, :integer, :default=>0
  #preference :max_amount, :integer, :default=>6
  
	def self.description
		"Create Tea"
  	end
  	
  def self.register
    super
    ProductCustomizationType.register_calculator(self)
  end

  def create_options
    ####################### FRUIT ######################
    [
     CustomizableProductOption.create(:name=>"appel", :presentation=>"Appel"),
    CustomizableProductOption.create(:name=>"ananas", :presentation=>"Ananas"),
    CustomizableProductOption.create(:name=>"papaya", :presentation=>"Papaya"),
    CustomizableProductOption.create(:name=>"zonneroosjes", :presentation=>"Zonneroosjes"),
    CustomizableProductOption.create(:name=>"sinaasappelschillen", :presentation=>"Sinaasappelschillen"),
    CustomizableProductOption.create(:name=>"brandnetel", :presentation=>"Brandnetel"),
    CustomizableProductOption.create(:name=>"ginkgo", :presentation=>"Ginkgo"),
    CustomizableProductOption.create(:name=>"lemongrass", :presentation=>"Lemongrass"),
    CustomizableProductOption.create(:name=>"nanamint", :presentation=>"Nanamint"),
    CustomizableProductOption.create(:name=>"sagebladeren", :presentation=>"Sagebladeren"),

	####################### KRUIDEN ######################
	
	CustomizableProductOption.create(:name=>"maretak", :presentation=>"Maretak"),
	CustomizableProductOption.create(:name=>"karwij", :presentation=>"Karwij"),
	CustomizableProductOption.create(:name=>"venkel", :presentation=>"Venkel"),
	CustomizableProductOption.create(:name=>"groenehaver", :presentation=>"Groen Haver"),
	CustomizableProductOption.create(:name=>"hibiscusbloesem", :presentation=>"Hibiscus Bloesem"),
	CustomizableProductOption.create(:name=>"anijszaad", :presentation=>"Anijszaad"),
	CustomizableProductOption.create(:name=>"kamille", :presentation=>"Kamille"),
	
	###################### SPECERIJEN ######################
	CustomizableProductOption.create(:name=>"bamboobladeren", :presentation=>"Bamboobladeren"),
	CustomizableProductOption.create(:name=>"rozenbladeren", :presentation=>"Rozenbladeren"),
	CustomizableProductOption.create(:name=>"pepermuntblad", :presentation=>"Pepermuntblad")
    ]
  end
    def compute(product_customization)
    	
    	return 0 unless valid_configuration? product_customization
    	#return 0 unless valid_configuration? product_customization
			## FRUIT ##
			appel = get_option(product_customization, "appel")
			ananas = get_option(product_customization, "ananas")
			papaya = get_option(product_customization, "papaya")
			zonneroosjes = get_option(product_customization, "zonneroosjes")
			sinaasappelschillen = get_option(product_customization, "sinaasappelschillen")
			brandnetel = get_option(product_customization, "brandnetel")		
			ginkgo = get_option(product_customization, "ginkgo")	
			lemongrass = get_option(product_customization, "lemongrass")	
			nanamint = get_option(product_customization, "nanamint")	
			sagebladeren = get_option(product_customization, "sagebladeren")
			## KRUIDEN ##
			maretak = get_option(product_customization, "maretak")
			karwij = get_option(product_customization, "karwij")
			venkel = get_option(product_customization, "venkel")
			groenehaver = get_option(product_customization, "groenehaver")
			hibiscusbloesem = get_option(product_customization, "hibiscusbloesem")
			anijszaad = get_option(product_customization, "anijszaad")
			kamille = get_option(product_customization, "kamille")
			## SPECERIJEN ##					
			bamboobladeren = get_option(product_customization, "bamboobladeren")
			rozenbladeren = get_option(product_customization, "rozenbladeren")
			pepermuntblad = get_option(product_customization, "pepermuntblad")
			
			# Calculator => amount x price
			# FRUIT #
			(appel.value.to_f * preferred_appel) + (ananas.value.to_f * preferred_ananas) + (papaya.value.to_f * preferred_papaya) + (zonneroosjes.value.to_f * preferred_zonneroosjes) + (sinaasappelschillen.value.to_f * preferred_sinaasappelschillen) + (brandnetel.value.to_f * preferred_brandnetel) + (ginkgo.value.to_f * preferred_ginkgo) + (lemongrass.value.to_f * preferred_lemongrass) + (nanamint.value.to_f * preferred_nanamint) + (sagebladeren.value.to_f * preferred_sagebladeren) + (maretak.value.to_f * preferred_maretak) + (karwij.value.to_f * preferred_karwij) + (venkel.value.to_f * preferred_venkel) + (groenehaver.value.to_f * preferred_groenehaver) + (hibiscusbloesem.value.to_f * preferred_hibiscusbloesem) + (anijszaad.value.to_f * preferred_anijszaad) + (kamille.value.to_f * preferred_kamille) + (bamboobladeren.value.to_f * preferred_bamboobladeren) + (rozenbladeren.value.to_f * preferred_rozenbladeren) + (pepermuntblad.value.to_f * preferred_pepermuntblad)      
  end

  def valid_configuration?(product_customization)
		#appel = get_option(product_customization, "appel")
		#papaya = get_option(product_customization, "papaya")
		#return false unless (appel.value.to_i + papaya.value.to_i) > 9
	    return true
  end
  
  def get_option(product_customization, name)
      product_customization.customized_product_options.detect {|cpo| cpo.customizable_product_option.name == name }
    end
 
end