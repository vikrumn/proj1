class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_url
	end
	def index
		@pokemons = Pokemon.all
	end
	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health - 10
		@pokemon.save
		if(@pokemon.health <= 0)
			@pokemon.destroy
		end
		redirect_to @pokemon.trainer
	end
	def new
                @pokemon = Pokemon.new
        end
        def create
                @pokemon = Pokemon.create(pokemon_params)
		@pokemon.level = 1
		@pokemon.health = 100
		@pokemon.trainer = current_trainer
		@pokemon.trainer_id = current_trainer.id
                if @pokemon.save #If saving the pokemon was successful
                        redirect_to current_trainer
                else
			redirect_to new_path
			flash[:error] = @pokemon.errors.full_messages.to_sentence
                end
        end
        private

        def pokemon_params
                params.require(:pokemon).permit(:name)
        end
end
