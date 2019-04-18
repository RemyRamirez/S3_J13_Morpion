require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'applications'

#lancement de l'application
Application.new.perform