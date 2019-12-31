require 'pry'
require "tty-prompt"
require_relative '../config/environment.rb'

prompt = TTY::Prompt.new



def clear_screen
    system"clear"
end

def choose_pokemon 
    # randomly samples 5 pokemon from all Pokemon in database
    pokemon = Pokemon.all.sample(5) 

    #outs array of pokemon.name from our pokemon array in line 15
    pokemon_names = pokemon.map do |pokemon| 
            pokemon.name
    end  

    puts "Do you like this team?" 
    puts pokemon_names
    team_option = gets.chomp.downcase
    if team_option == "no" #anything other then lowercase no is treated as yes
        choose_pokemon
    else
        #trainer.pokemons << pokemon
        puts "Okay, great! Let's get started!"
    end
end

def computer_pokemon
    pokemon_name_array = []
    Pokemon.all.select do |pokemon|
        pokemon_name_array << pokemon.name
    end
    puts pokemon_name_array.sample(5)
end


    def welcome
        clear_screen
        puts "Welcome to Pokemon Battler"
        puts "Please enter your name!"
        username = gets.chomp
        puts "Hi #{username}! Welcome to the world of pokémon! My name is Professor Oak! People call me the pokémon Professor! This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. Myself...I study pokémon as a profession."
        puts "Are you here to test your skills battling Pokemon?"
        puts "Please type Yes or No"
        battle_option = gets.chomp.downcase
        if battle_option == "no"
        exit
        else
            puts "Let's battle! But first, you will need to accept your team!"
            choose_pokemon
        end
    end





   
        




#binding.pry
welcome