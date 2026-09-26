import { LightningElement, wire } from 'lwc';
import getHighRevenueAccountRecords from '@salesforce/apex/AccountController.getHighRevenueAccountRecords';


export default class HighRevenueAccounts extends LightningElement {
    accountsToDisplay= [];
    countOfRecords=1;
    @wire(getHighRevenueAccountRecords,{count:'$countOfRecords'})
    getAccountHandler(response){

        const { data, error} = response; //destructuring


        if(error){
            console.error(error);
            return;
        }
        if(data){
            this.accountsToDisplay= data;
        }
    }

    setCount(event){
         console.log('Value', event.target.value);
        let inputValue = event.target.value;
        if(inputValue=='') return;
        this.countOfRecords=event.target.value;
    }
}