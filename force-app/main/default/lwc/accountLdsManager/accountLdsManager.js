import { LightningElement, api, wire } from 'lwc';
import {getRecord,createRecord,updateRecord,deleteRecord} from 'lightning/uiRecordApi';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';


export default class AccountLdsManager extends LightningElement {

    @api recordId;


    // GET RECORD

    @wire(getRecord, {
        recordId: '$recordId',
        fields: [
            NAME_FIELD,
            PHONE_FIELD,
            INDUSTRY_FIELD
        ]    })
    account;


    get accountName() {

        return this.account.data
            ? this.account.data.fields.Name.value
            : '';

    }
    get accountPhone() {

        return this.account.data
            ? this.account.data.fields.Phone.value
            : '';

    }


    // CREATE RECORD

    createAccount() {

        const fields = {};

        fields[NAME_FIELD.fieldApiName] =
            'LDS Test Account';

        fields[PHONE_FIELD.fieldApiName] =
            '9999999999';

        fields[INDUSTRY_FIELD.fieldApiName] =
            'Technology';


        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: fields
        };


        createRecord(recordInput)

            .then(result => {

                console.log(
                    'Account Created:',
                    result.id
                );

            })

            .catch(error => {

                console.error(error);

            });

    }


    // UPDATE RECORD

    updateAccount() {

        const fields = {};

        fields.Id = this.recordId;

        fields[NAME_FIELD.fieldApiName] =
            'Updated LDS Account';


        const recordInput = {
            fields: fields
        };


        updateRecord(recordInput)

            .then(result => {

                console.log(
                    'Account Updated:',
                    result.id
                );

            })

            .catch(error => {

                console.error(error);

            });

    }


    // DELETE RECORD

    deleteAccount() {

        deleteRecord(this.recordId)

            .then(() => {

                console.log(
                    'Account Deleted'
                );

            })

            .catch(error => {

                console.error(error);

            });

    }
    // EDIT FORM SUCCESS

    handleSuccess(event) {

        console.log(
            'Form Saved:',
            event.detail.id
        );

    }

}