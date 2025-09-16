import { Component, OnInit } from '@angular/core';
import { FeeStudentService } from '../../service/fee-student.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FeeCatagoryModel } from '../../model/fee.model';
import { StudentAddService } from '../../service/student-add.service';
import { StudntAddForm } from '../../model/student.model';

@Component({
  selector: 'app-fee-collect',
  templateUrl: './fee-collect.component.html',
  styleUrl: './fee-collect.component.css'
})
export class FeeCollectComponent implements OnInit{


  
  formValue!: FormGroup;
  fee: FeeCatagoryModel = new FeeCatagoryModel();
  feeData: any[]=[]; 
  studentIds:StudntAddForm[]=[];

  studentId: number | undefined;
  searchKeyword: string = '';
 







  months: string[] = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

constructor(

   private feeservice:FeeStudentService,
   private studentservice:StudentAddService,
   private formBuilder:FormBuilder
   ){

   }
  

ngOnInit(): void {
  this.formValue = this.formBuilder.group({
    feeid: [''], 
    ssid:[''],
    feeCatagory: [''],
    feeMonth: [''],
    feeAmount: [''],
    paymentDate: [''],
    query: [''],
    studentAddModel:[null]
 
  });
  this.getAll();
  this.loadFee();
this.loadStudent();
}







private loadFee(){
this.feeservice.getAllFee().subscribe(
  data => this.feeData = data,
  error => console.error('Error fetching Fee', error)
);

}

private loadStudent() {
this.studentservice.getAllStudents().subscribe(
  data => this.studentIds = data,
  error => console.error('Error fetching Sid', error)
);
}





setFeeModelFromForm(): void {
  this.fee.feeCatagory = this.formValue.value.feeCatagory;
  this.fee.feeMonth = this.formValue.value.feeMonth;
  this.fee.feeAmount = this.formValue.value.feeAmount;
  this.fee.studentAddModel = {
    sid: this.formValue.value.studentAddModel
  };

}




saveFee() {
this.setFeeModelFromForm();
this.feeservice.saveFee(this.fee)
  .subscribe(
    (res) => {
      
      this.formValue.reset();
      alert("Fee Saved");
      this.getAll();
    },
    (err) => {
      console.error("Error saving Fee:", err);
      
      alert("Fee Not Saved. Check console for details.");
    }
  );
}

  getAll(): void {
    this.feeservice.getAllFee()
      .subscribe(res => {
        this.feeData = res;     
      });
  }

  loadFeeData(): void {
    if (this.studentId !== undefined) { // Check if studentId is defined
      this.feeservice.getFeeByStudentId(this.studentId)
        .subscribe(
          (data: FeeCatagoryModel[]) => {
            this.feeData = data;
            console.log('Fees:', this.feeData);
          },
          (error) => {
            console.error('Error fetching fees:', error);
          }
        );
    }
  }
  getFeesByStudentId(): void {
    const studentId = parseInt(this.searchKeyword, 10); // Parse searchKeyword into a number
    if (!isNaN(studentId)) { // Check if the parsing was successful
      this.studentId = studentId;
      this.loadFeeData();
    } else {
      console.error('Invalid student ID:', this.searchKeyword);
    }
  }


  // printLastPaymentReceipt() {

  //   this.feeservice.createFeeRecepit().subscribe(
  //     (pdfBytes: any) => {

  //       const blob = new Blob([pdfBytes], { type: 'application2/pdf' });

  //       const url = window.URL.createObjectURL(blob);

  //       window.open(url);
  //     },
  //     (error) => {
  //       console.error('Error occurred while generating withdraw receipt:', error);
       
  //     }
  //   );
  // }

  printLastPaymentReceipt() {
    this.feeservice.createFeeRecepit().subscribe(
      (pdfBlob: Blob) => {
        const blobUrl = window.URL.createObjectURL(pdfBlob);
        window.open(blobUrl);
      },
      error => {
        console.error('Error generating payment receipt:', error);
      }
    );
  }



}
