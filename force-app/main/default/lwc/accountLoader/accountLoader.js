import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountLoader extends LightningElement {

    accounts = [];

    loadAccounts() {

        getAccounts()
            .then(result => {

                this.accounts = result;

            })
            .catch(error => {

                console.error(error);

                this.showError('Unable to load accounts');

            });
    }

    showError(message) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: message,
                variant: 'error'
            })
        );
    }
}