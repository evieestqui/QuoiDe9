// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import RouletteController from "./roulette_controller"
application.register("roulette", RouletteController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)
