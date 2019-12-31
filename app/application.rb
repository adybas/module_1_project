require 'pry'
require "tty-prompt"
require_relative '../config/environment.rb'

prompt = TTY::Prompt.new



    def clear_screen
        system"clear"
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
        puts "Let's battle! But first, you will need to choose a Pokemon!" 
        end
    end

    def choose_pokemon
        pokemon = Pokemon.all
        binding.pry
    end




   
        




#binding.pry
choose_pokemon