import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    console.log('person controller connected')
  }

  phoneChanged(e) {
    const targetClasses = e.target.classList
    if (e.key.length == 1 && !e.key.match("\\d")) {
      e.target.value = e.target.value.slice(0, -1)
      e.preventDefault()
      return;
    }
    if (e.key.length == 1 && e.key.match("\\d")) {
      this.formatPhoneNum(e.target);
    }
    if (e.target.value.length >= 12) {
      targetClasses.remove("input-error");
      targetClasses.add("input-primary");
      e.target.parentElement.querySelector("label span").innerHTML = "";
    } else {
      targetClasses.remove("input-primary");
      targetClasses.add("input-error");
      e.target.parentElement.querySelector(".label-text-alt").innerHTML =
        "invalid phone number";
    }
  }

  isNumber(char) {
    if (typeof char !== 'string') {
      return false;
    }

    if (char.trim() === '') {
      return false;
    }

    return !isNaN(char);
  }


  formatPhoneNum = (inputField) => {
    const nums = inputField.value.split('-').join("");
    const countryCode = '1';
    const digits = nums[0] === countryCode ? 1 : 0;

    // get character position of the cursor:
    let cursorPosition = inputField.selectionStart;

    // add dashes (format 1-xxx-xxx-xxxx or xxx-xxx-xxxx):
    if (nums.length > digits+10) {
        inputField.value = `${digits === 1 ? nums.slice(0, digits) + '-' : ""}` + nums.slice(digits,digits+3) + '-' + nums.slice(digits+3,digits+6) + '-' + nums.slice(digits+6,digits+10);
    }
    else if (nums.length > digits+6) {
        inputField.value = `${digits === 1 ? nums.slice(0, digits) + '-' : ""}` + nums.slice(digits,digits+3) + '-' + nums.slice(digits+3,digits+6) + '-' + nums.slice(digits+6,nums.length);
    }
    else if (nums.length > digits+5) {
        inputField.value = `${digits === 1 ? nums.slice(0, digits) + '-' : ""}` + nums.slice(digits,digits+3) + '-' + nums.slice(digits+3,nums.length);
    }
    else if (nums.length > digits+3) {
        inputField.value = `${digits === 1 ? nums.slice(0, digits) + '-' : ""}` + nums.slice(digits, digits+3) + '-' + nums.slice(digits+3, nums.length);
    }
    else if (nums.length > 1 && digits === 1) {
        inputField.value = nums.slice(0,digits) + '-' + nums.slice(digits, nums.length);
    }

    // reseting the input value automatically puts the cursor at the end, which is annoying,
    // so reset the cursor back to where it was before, taking into account any dashes that we added...
    // if the character 1 space behind the cursor is a dash, then move the cursor up one character:
    if (inputField.value.slice(cursorPosition-1, cursorPosition) === '-') {
        cursorPosition++;
    }

    inputField.selectionStart = cursorPosition;
    inputField.selectionEnd = cursorPosition;
  }
}
