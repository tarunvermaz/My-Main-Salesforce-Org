import { LightningElement } from 'lwc';

export default class DataBindingComponent extends LightningElement {
    Greeting ="Jai Ram Jii ki";
    firstName = "Tarun";

    firstnameis= '';
    lastname= '';

    handleChange(event){
        const field = event.target.name;

        if(field === 'fname'){
            this.firstnameis = event.target.value;
        } else if(field ==='lname'){
            this.lastname = event.target.value;
        }
    }
    //getter
    get upperCasedFullName(){
        return `${this.firstnameis} ${this.lastname}`.toUpperCase();
    }

    handleClick(event){
        const input = this.template.querySelector('[data-id="nameInput"]');
    this.firstName = input.value;
    }
}