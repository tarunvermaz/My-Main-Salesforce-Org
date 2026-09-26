import { LightningElement, track } from 'lwc';

export default class StudenRegistrationForm extends LightningElement {
//Premitive Properties

    firstName='';
    lastName='';
    email='';

    //Non Premitive
    studentdata={};

    //reactive
    @track reactiveStudentData={};

    handleFirstNameChange(event){
        console.log('First Name is Updating');
        //this.firstName= event.target.value;
        // this.studentdata.firstName=event.target.value;
         this.reactiveStudentData.firstName=event.target.value;
    }
    handleLastNameChange(event){
        console.log('Last Name is Updating');
        //this.lastName= event.target.value;
        // this.studentdata.lastName=event.target.value;
          this.reactiveStudentData.lastName=event.target.value;
    }
    handleEmailChange(event){
        console.log('Email is Updating');
        //this.email= event.target.value;
        // this.studentdata.email=event.target.value;
         this.reactiveStudentData.email=event.target.value;
    }
}