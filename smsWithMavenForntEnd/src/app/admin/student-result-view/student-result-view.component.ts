import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ResultAddModel } from '../../model/result.model';
import { StudntAddForm } from '../../model/student.model';
import { ResultAddService } from '../../service/result-add.service';
import { StudentAddService } from '../../service/student-add.service';

@Component({
  selector: 'app-student-result-view',
  templateUrl: './student-result-view.component.html',
  styleUrl: './student-result-view.component.css'
})
export class StudentResultViewComponent implements OnInit{




  
  resultform!: FormGroup;
  result: ResultAddModel = new ResultAddModel();
  resultData: any[]=[]; 
  studentIds:StudntAddForm[]=[];

  studentId: number | undefined;
  searchKeyword: string = '';
 


constructor(

   private resultservice:ResultAddService,
   private studentservice:StudentAddService,
   private formBuilder:FormBuilder
   ){

   }
  


  ngOnInit(): void {
    this.resultform =this.formBuilder.group({

      rid: [''], 
      stid:[''],
      rbangla:['',Validators.required],
      rmath:['',Validators.required],
      renglish:['',Validators.required],
      rislam:['',Validators.required],
      rscince:['',Validators.required],
      rsocial:['',Validators.required],
      rtotalmark:['',Validators.required],
      ravg:['',Validators.required],
      rgpa:['',Validators.required],
      rgrade:['',Validators.required],
      rpassFail:['',Validators.required],
      rexamcatagory:['',Validators.required],
      studentAddModel:[null]
    }); 
    this.getAll();
}







private loadResult(){
this.resultservice.getAllResult().subscribe(
  data => this.resultData = data,
  error => console.error('Error fetching Fee', error)
);

}

// private loadStudent() {
// this.studentservice.getAllStudents().subscribe(
//   data => this.studentIds = data,
//   error => console.error('Error fetching Sid', error)
// );
// }





// setFeeModelFromForm(): void {
//   this.result. = this.formValue.value.feeCatagory;
//   this.fee.feeMonth = this.formValue.value.feeMonth;
//   this.fee.feeAmount = this.formValue.value.feeAmount;
//   this.fee.studentAddModel = {
//     stid: this.formValue.value.studentAddModel
//   };

// }





  getAll(): void {
    this.resultservice.getAllResult()
      .subscribe(res => {
        this.resultData = res;     
      });
  }

  loadResultData(): void {
    if (this.studentId !== undefined) { // Check if studentId is defined
      this.resultservice.getAllById(this.studentId)
        .subscribe(
          (data: ResultAddModel[]) => {
            this.resultData= data;
            console.log('result:', this.resultData);
          },
          (error) => {
            console.error('Error fetching Result:', error);
          }
        );
    }
  }
  getResultByStudentId(): void {
    const studentId = parseInt(this.searchKeyword, 10); // Parse searchKeyword into a number
    if (!isNaN(studentId)) { // Check if the parsing was successful
      this.studentId = studentId;
      this.loadResult();
    } else {
      console.error('Invalid student ID:', this.searchKeyword);
    }
  }
}


