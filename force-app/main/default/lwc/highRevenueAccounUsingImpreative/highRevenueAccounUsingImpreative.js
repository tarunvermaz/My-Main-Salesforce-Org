import { LightningElement, wire } from 'lwc';
import getHighRevenueAccountRecords from '@salesforce/apex/AccountController.getHighRevenueAccountRecords';


export default class HighRevenueAccounts extends LightningElement {
    accountsToDisplay= [];
    countOfRecord=2;

    connectedCallback(){
        getHighRevenueAccountRecords({count: this.countOfRecord}).then(response =>{
            console.log('Response Using impreative Approach', response);
            this.accountsToDisplay=response;
        }).catch(error =>{
            console.error('Error',error);
        })
    }
    
    setCount(event){
        console.log('Value', event.target.value);
        let inputValue = event.target.value;
        if(inputValue=='') return;
        this.countOfRecord=inputValue;
        getHighRevenueAccountRecords({count: this.countOfRecord}).then(response =>{
            console.log('Response Using impreative Approach', response);
            this.accountsToDisplay=response;
        }).catch(error =>{
            console.error('Error',error);
        })
    }
}