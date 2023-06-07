// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import "bs5-lightbox";

import Lightbox from "bs5-lightbox";

const options = {
	keyboard: true,
	size: "fullscreen"
};

document.querySelectorAll(".my-lightbox-toggle").forEach((el) => el.addEventListener("click", (e) => {
	e.preventDefault();
	const lightbox = new Lightbox(el, options);
	lightbox.show();
}));
