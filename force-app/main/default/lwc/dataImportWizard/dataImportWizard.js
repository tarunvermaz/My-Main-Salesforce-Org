import { LightningElement, wire } from 'lwc';
import getSalesforceObjects from '@salesforce/apex/DataImportWizardController.getSalesforceObjects';
import getObjectFields from '@salesforce/apex/DataImportWizardController.getObjectFields';
import importRecords from '@salesforce/apex/DataImportWizardController.importRecords';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DataImportWizard extends LightningElement {
    //to fatch data and store
    fileName = '';
    csvData = '';
    selectedObject = '';
    //to store data
    objectOptions = [];
    fields = [];
    csvOptions = [];
    //checking import
    isImporting = false;

    //Ye method component load hote hi Apex ko call karta hai.
    @wire(getSalesforceObjects)
    wiredObjects({ data, error }) {
        if (data) {
            this.objectOptions = data;
        } else if (error) {
            this.showToast('Error', this.getErrorMessage(error), 'error');
        }
    }

    //Ye method tab call hota hai jab user CSV file select karta hai.
    handleFileChange(event) {
        const file = event.target.files[0];
        if (!file) {
            return;
        }
        this.fileName = file.name;
        const reader = new FileReader();
        reader.onload = () => {
            this.csvData = reader.result;
            const firstLine = this.csvData.split(/\r?\n/)[0];
            this.csvOptions = firstLine
                .split(',')
                .map(header => header.trim())
                .filter(header => header)
                .map(header => ({
                    label: header,
                    value: header
                }));
        };
        reader.onerror = () => {
            this.showToast('Error', 'Unable to read CSV file', 'error');
        };
        reader.readAsText(file);
    }

    //User ne dropdown mein jo object select kiya, woh store hota hai.
    handleObjectChange(event) {
        this.selectedObject = event.detail.value;

        getObjectFields({
            objectApiName: this.selectedObject
        })
            .then(result => {
                this.fields = result.map(field => ({
                    ...field,
                    csvColumn: ''
                }));
            })
            .catch(error => {
                this.showToast(
                    'Error',
                    this.getErrorMessage(error),
                    'error'
                );
            });
    }

    //Jab user kisi Salesforce field ke saamne CSV column select karta hai, ye method call hota hai.
    handleMappingChange(event) {
        const fieldApiName = event.target.dataset.field;
        const csvColumn = event.detail.value;

        this.fields = this.fields.map(field => {
            if (field.value === fieldApiName) {
                return {
                    ...field,
                    csvColumn: csvColumn
                };
            }
            return field;
        });
    }

    //Ye main method hai. Import button click hone par call hota hai.
    handleImport() {
        //Basic validation
        if (!this.csvData) {
            this.showToast('Error', 'Please upload a CSV file', 'error');
            return;
        }
        if (!this.selectedObject) {
            this.showToast('Error', 'Please select a Salesforce object', 'error');
            return;
        }
        //Har mapped field ko mapping object mein add karta hai.
        const fieldMappings = {};
        this.fields.forEach(field => {
            if (field.csvColumn) {
                fieldMappings[field.value] = field.csvColumn;
            }
        });
        if (Object.keys(fieldMappings).length === 0) {
            this.showToast(
                'Error',
                'Please map at least one field',
                'error'
            );
            return;
        }

        this.isImporting = true;

        importRecords({
            objectApiName: this.selectedObject,
            csvData: this.csvData,
            fieldMappings: JSON.stringify(fieldMappings)
        })
            .then(result => {
                this.showToast('Success', result, 'success');
            })
            .catch(error => {
                console.error('Import Error:', JSON.stringify(error));

                this.showToast(
                    'Import Error',
                    this.getErrorMessage(error),
                    'error'
                );
            })
            .finally(() => {
                this.isImporting = false;
            });
    }

    // Reusable method hai.
    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }

    // Iska kaam error object se readable message nikalna hai.
    getErrorMessage(error) {
        if (error?.body?.message) {
            return error.body.message;
        }

        if (Array.isArray(error?.body)) {
            return error.body
                .map(item => item.message)
                .filter(message => message)
                .join(', ');
        }

        if (error?.message) {
            return error.message;
        }

        return 'Unknown error occurred';
    }
}