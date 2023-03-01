// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FormValidationController from "./form_validation_controller"
application.register("form-validation", FormValidationController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import NestedFormController from "./nested_form_controller"
application.register("nested-form", NestedFormController)
