import cds from '@sap/cds';

export class CatalogService extends cds.ApplicationService {
   
    init(): Promise<void> {

        const { Joke } = cds.entities;

        this.on('toggleEnable', 'Joke', async req => {
            console.log("HAHA")
        });

        this.after('READ', 'Joke', allJokes => {
            // To use if need to validate anything
            
        })

        return super.init();
    }
}