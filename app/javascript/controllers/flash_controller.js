import { Controller } from "stimulus";

export default class extends Controller {
  close(e) {
    e.preventDefault();
    this.element.remove();
    // e.target.parentElement.remove();
    // console.log("close!!!");
  }
}
