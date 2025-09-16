export class FeeCatagoryModel {
    feeid?: number;
    ssid?:number;
    feeCatagory?: string;
    feeMonth?: string;
    feeAmount?: string;
    paymentDate?: string;
    studentAddModel?: {
      sid?: number;
      batchId?: string;
      session?: string;
      stClass?: string;
      stRoll?: string;
      stfirstname?: string;
      stlastname?: string;
      stemail?: string;
      stfathersname?: string;
      stmothersname?: string;
      stpassword?: string;
      strole?: string;
      stdob?: string;
      staddress?: string;
      stgender?: string;
      stphone?: string;
      stPhoto?: any; // You can replace 'any' with the appropriate type for the photo data
      feeCatagoryModels?: FeeCatagoryModel[];
    


    }
  }
    
    
    
    
    
    
  //   StudentAddModel;
  
  //   constructor(data: any) {
  //     Object.assign(this, data);
  //     this.studentAddModel = new StudentAddModel(data.studentAddModel);
  //   }
  // }

  // export class StudentAddModel {
  //   sid?: number;
  //   batchId?: string;
  //   session?: string;
  //   stClass?: string;
  //   stRoll?: string;
  //   stfirstname?: string;
  //   stlastname?: string;
  //   stemail?: string;
  //   stfathersname?: string;
  //   stmothersname?: string;
  //   stpassword?: string;
  //   strole?: string;
  //   stdob?: string;
  //   staddress?: string;
  //   stgender?: string;
  //   stphone?: string;
  //   stPhoto: any; // You can replace 'any' with the appropriate type for the photo data
  //   feeCatagoryModels?: FeeCatagoryModel[];
  
  //   constructor(data: any) {
  //     Object.assign(this, data);
  //   }
  // }