require 'pry'
require "tty-prompt"
require_relative '../config/environment.rb'

#prompt = TTY::Prompt.new
@trainer = nil
@computer_trainer = []
@trainer_pkmn_hp = 0
@computer_pkmn_hp = 0

def clear_screen
    system"clear"
end

def choose_pokemon 
    clear_screen
    # randomly samples 1 pokemon from all Pokemon in database
    random_pokemon = Pokemon.all.sample
    # sets var to pokemon.name
    pokemon_name = random_pokemon.name
    puts "\n"
    puts "Do you like this pokemon?"
    puts "\n"
    puts "Yes or No" 
    puts "\n"
    # puts pokemon_names
    puts pokemon_name
    puts "\n"
    team_option = gets.chomp.downcase

    if team_option == "yes"
        clear_screen
        puts "Okay, great! Let's get started!"
        puts "\n"
        @trainer.pokemons.clear
        @trainer.pokemons << random_pokemon
        @trainer_pkmn_hp = @trainer.pokemons[0].max_hp
        puts "#{@trainer.pokemons.last.name} has been added to Trainer #{@trainer.name}'s team!"
        puts "\n"
    elsif  team_option == "no"
        choose_pokemon
    end
end

def computer_pokemon
    random_pokemon = Pokemon.all.sample
    @computer_trainer.clear
    @computer_trainer << random_pokemon
    @computer_pkmn_hp = @computer_trainer[0].max_hp
end

def starting_battle_dialog
    puts "Team Rocket Grunt has been assigned #{@computer_trainer[0].name}"
    puts "\n"
    puts "Let's Battle #{@trainer.pokemons.last.name} VS #{@computer_trainer[0].name}"
    puts "Your pokemon will go first!"
    puts "\n"
end

def tr_pkmn_dmg(input)
    if input == 1
        puts "#{@trainer.name}'s #{@trainer.pokemons[0].name} uses #{@trainer.pokemons[0].attacks[input.to_i - 1].move}, which does #{@trainer.pokemons[0].attacks[input.to_i - 1].move_damage} damage to #{@computer_trainer[0].name}!"
        @computer_pkmn_hp -= @trainer.pokemons[0].attacks[input.to_i - 1].move_damage
        
    elsif input == 2
        puts "#{@trainer.name}'s #{@trainer.pokemons[0].name} uses #{@trainer.pokemons[0].attacks[input.to_i - 1].move}, which does #{@trainer.pokemons[0].attacks[input.to_i - 1].move_damage} damage to #{@computer_trainer[0].name}!"
        @computer_pkmn_hp -= @trainer.pokemons[0].attacks[input.to_i - 1].move_damage
        
    elsif input == 3
        puts "#{@trainer.name}'s #{@trainer.pokemons[0].name} uses #{@trainer.pokemons[0].attacks[input.to_i - 1].move}, which does #{@trainer.pokemons[0].attacks[input.to_i - 1].move_damage} damage to #{@computer_trainer[0].name}!"
        @computer_pkmn_hp -= @trainer.pokemons[0].attacks[input.to_i - 1].move_damage
        
    elsif input == 4
        puts "#{@trainer.name}'s #{@trainer.pokemons[0].name} uses #{@trainer.pokemons[0].attacks[input.to_i - 1].move}, which does #{@trainer.pokemons[0].attacks[input.to_i - 1].move_damage} damage to #{@computer_trainer[0].name}!"
        @computer_pkmn_hp -= @trainer.pokemons[0].attacks[input.to_i - 1].move_damage
        
    else
        puts "You must attack!"
        puts "\n"
        puts "\n"
        battle_input
    end
    
    puts "\n"
    puts "Team Rocket Grunts #{@computer_trainer[0].name} has #{@computer_pkmn_hp} HP remaining!"
    puts "\n"
end

def battle_input
    pkmn_attack_array = @trainer.pokemons[0].attacks
   
    puts "Which move would you like to use?"
    puts "\n"
    pkmn_attack_array.each_with_index do |attack_obj, index|
        puts "#{index + 1}. #{attack_obj.move}"
    end
    input = gets.chomp.to_i
    tr_pkmn_dmg(input)
end

def computer_pkmn_dmg 
    puts "Team Rocket Grunts #{@computer_trainer[0].name} uses #{@computer_trainer[0].attacks[rand(0..3)].move}, which does #{@computer_trainer[0].attacks[rand(0..3)].move_damage} damage to #{@trainer.pokemons[0].name}!"
    @trainer_pkmn_hp -= @computer_trainer[0].attacks[rand(0..3)].move_damage
    puts "\n"
    
    puts "#{@trainer.name}'s #{@trainer.pokemons[0].name} has #{@trainer_pkmn_hp} HP remaining!"
    puts "\n"      
end

def you_dead?
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"
    if @trainer_pkmn_hp <= 0 
        abort("Team Rocket Grunt won with their #{@computer_trainer[0].name}! #{@trainer.name} runs in terror!!")
    elsif @computer_pkmn_hp <= 0
        puts "\n"
        puts "\n"
        puts "\n"
        puts "\n"
        puts "\n"
        puts "\n"
        abort("#{@trainer.name} won with their #{@trainer.pokemons[0].name}! The Team Rocket Grunt runs in terror!!")
      
    end      
end

def battle_simulator
    while @computer_pkmn_hp >= 0 || @trainer_pkmn_hp >= 0 
        battle_input
        computer_pkmn_dmg
        you_dead?
    end
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
        clear_screen
        pokemon_ascii
        puts "Hi #{@trainer.name}! Welcome to the world of pokémon! My name is Professor Oak! People call me the pokémon Professor! This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. Myself...I study pokémon as a profession."
        puts "\n"
        puts "Are you here to test your skills battling Pokemon?"
        puts "\n"
        puts "Please type Yes or No"
        battle_option = gets.chomp.downcase
        if battle_option == "no" 
            exit
        else
            "\n"
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
    starting_battle_dialog
    # battle_input
    battle_simulator
end

run