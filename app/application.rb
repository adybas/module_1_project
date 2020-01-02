require 'pry'
require "tty-prompt"
require_relative '../config/environment.rb'

#prompt = TTY::Prompt.new
@trainer = nil
@computer_trainer = []

def clear_screen
    system"clear"
end

def choose_pokemon 
    # randomly samples 5 pokemon from all Pokemon in database
    # pokemon = Pokemon.all.sample(5)
    # array of pokemon.name from our pokemon array in line 15
    # pokemon_names = pokemon.map do |pokemon| 
    #         pokemon.name
    # end  

    # randomly samples 1 pokemon from all Pokemon in database
    random_pokemon = Pokemon.all.sample
    # sets var to pokemon.name
    pokemon_name = random_pokemon.name

    puts "Do you like this pokemon? Yes or No" 
    # puts pokemon_names
    puts pokemon_name
    team_option = gets.chomp.downcase

    if team_option == "yes"
        puts "Okay, great! Let's get started!"
        @trainer.pokemons.clear
        @trainer.pokemons << random_pokemon
        puts "#{@trainer.pokemons.last.name} has been added to Trainer #{@trainer.name}'s team!"
    elsif  team_option == "no"
        choose_pokemon
    end
end

def computer_pokemon
    random_pokemon = Pokemon.all.sample
    @computer_trainer.clear
    @computer_trainer << random_pokemon
    puts "Trainer Computer has been assigned #{@computer_trainer[0].name}"
    puts "Let's Battle"
end

def pokemon_ascii
    clear_screen
pp "                                     ,' \\                               "
pp "     _.----.          ____         ,'   _\\  ___     ___    ____        "
pp " _,-'        `.      |    |  /`.   \\,-'    |   \\  /   |  |    \\  |`.  "
pp " \\      __    \\    '-.  | /   `.  ___     |    \\/    |  '-.   \\ |   | "
pp "  \\.   \\ \\   |  __  |  |/    ,',' _  `.  |           | __  |   \\|   | "
pp "   \\    \\/   /,' _ `.|      ,' /  /  / /   |          ,' _`.|     |   |  "
pp "    \\     ,-'/  /   \\    ,'   |  \\/ / ,`.|         /  /   \\   |     |  "
pp "     \\    \\ |  \\_/  |   `-.  \\    `'  / |  |    ||   \\_/  |  |\\   | "
pp "      \\    \\ \\      /       `-.`.___,-'  |  |\\  /| \\      /  | |   | "
pp "       \\    \\ `.__,'|  |`-._    `|        |__| \\/ |  `.__,'|   | |   | "
pp "        \\_.-'        |__|    `-._ |                  '-.|     '-.| |   | "
pp "                                  `'                                '-._| "
end


    def welcome
    
        puts "Welcome to Pokemon Battler"
        puts "Please enter your name!"
    end

    def user_input
        username = gets.chomp
        @trainer = Trainer.find_or_create_by(name: username)
    end
   
    def start
        puts "Hi #{@trainer.name}! Welcome to the world of pokémon! My name is Professor Oak! People call me the pokémon Professor! This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. Myself...I study pokémon as a profession."
        puts "Are you here to test your skills battling Pokemon?"
        puts "Please type Yes or No"
        battle_option = gets.chomp.downcase
        if battle_option == "no" 
            exit
        else
            puts "Let's battle! But first, you will need to accept your team!"
        end
    end

def run
    pokemon_ascii
    welcome
    user_input
    start
    choose_pokemon
    computer_pokemon
end

run

#binding.pry