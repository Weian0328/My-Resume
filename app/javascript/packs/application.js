import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "scripts";
import "controllers";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
// stimulus js
window.Stimulus = Application.start();
const context = require.context("../controllers", true, /\.js$/);
Stimulus.load(definitionsFromContext(context));
