import { LightningElement } from 'lwc';

export default class RenderingListForEach extends LightningElement {
    contacts = [
        {
            Id: 1,
            Name:'Sanjay Gupta',
            Title:'Founder of tech school'
        },
        {
            Id: 2,
            Name:'tarun verma',
            Title:'CEO of tech school'
        },
        {
            Id: 3,
            Name:'Shivam Verma',
            Title:'Md of tech school'
        },
        {
            Id: 4,
            Name:'Suresh gehlot',
            Title:'chaimen of tech school'
        },
        {
            Id: 5,
            Name:'Narendra Modi',
            Title:'bharat ka pradhanmantri'
        },
        {
            Id: 6,
            Name:'Donald trump',
            Title:'usa ka president'
        }
    ];
}