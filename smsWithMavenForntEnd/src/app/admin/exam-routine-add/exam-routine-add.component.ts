// import { Component, OnInit } from '@angular/core';
// import { FormBuilder, FormGroup, Validators } from '@angular/forms';
// import { ExamModel } from '../../model/exam.model';
// import { SubjectService } from '../../service/subject.service';
// import { ExamserviceService } from '../../service/examservice.service';

// @Component({
//   selector: 'app-exam-routine-add',
//   templateUrl: './exam-routine-add.component.html',
//   styleUrl: './exam-routine-add.component.css'
// })
// export class ExamRoutineAddComponent implements OnInit{

  
// routineform !:FormGroup;
// routineModel : ExamModel = new ExamModel();
// routineDataStore : any[]=[];
// // studentId:StudntAddForm[]=[];

// constructor(
//   private formBuilder :FormBuilder,
//   private subjectservice:SubjectService,
//   private routineserice :ExamserviceService
// ){}

//   ngOnInit(): void {
//     this.routineform =this.formBuilder.group({
  
//       exid: [''],      
//       exClass:['',Validators.required],
//       exTime:['',Validators.required],
//       exSubject1:['',Validators.required],
//       exSubject2:['',Validators.required],
//       exSubject3:['',Validators.required],
//       exSubject4:['',Validators.required],
//       exSubject5:['',Validators.required],
//       exSubject6:['',Validators.required],
//       exSubject7:['',Validators.required],
//       exdate1:['',Validators.required],
//       exdate2:['',Validators.required],
//       exdate3:['',Validators.required],
//       exdate4:['',Validators.required],
//       exdate5:['',Validators.required],
//       exdate6:['',Validators.required],
//       exdate7:['',Validators.required],
//       subjectModel:[null]
//     }); 
//     // this.loadResult();
//     // this.loadStudent();
//   }
//   setRoutineModelFrom(): void {   
  
//     this.routineModel.exClass = this.routineform.value.exClass;
//     this.routineModel.exTime = this.routineform.value.exTime;
//     this.routineModel.exSubject1 = this.routineform.value.exSubject1;
//     this.routineModel.exSubject2 = this.routineform.value.exSubject2;
//     this.routineModel.exSubject3 = this.routineform.value.exSubject3;
//     this.routineModel.exSubject4 = this.routineform.value.exSubject4;
//     this.routineModel.exSubject5 = this.routineform.value.exSubject5;
//     this.routineModel.exSubject6 = this.routineform.value.exSubject6;
//     this.routineModel.exSubject7 = this.routineform.value.exSubject7
//     this.routineModel.exdate1 = this.routineform.value.exdate1;
//     this.routineModel.exdate2 = this.routineform.value.exdate2;
//     this.routineModel.exdate3 = this.routineform.value.exdate3;
//     this.routineModel.exdate4 = this.routineform.value.exdate4;
//     this.routineModel.exdate5 = this.routineform.value.exdate5;
//     this.routineModel.exdate6 = this.routineform.value.exdate6;
//     this.routineModel.exdate7 = this.routineform.value.exdate7;

//     this.routineModel.subjectModel = {
//       subid: this.routineform.value.subjectadd
//     };
  

//   }


// // private loadResult(){
// //   this.resultservice.getAllResult().subscribe(
// //     data => this.resultsDataStore = data,
// //     error => console.error('Error fetching Fee', error)
// //   );
  
// //   }
  
// //   private loadStudent() {
// //   this.studentservice.getAllStudents().subscribe(
// //     data => this.studentId = data,
// //     error => console.error('Error fetching Sid', error)
// //   );
// //   }
  

//  saveroutine() {
// this.setRoutineModelFrom();
// this.routineserice.saveRoutine(this.routineModel)
//   .subscribe(
//     (res) => {
      
//       this.routineform.reset();
//       alert("Exam Routine Saved");      
//     },
//     (err) => {
//       console.error("Error saving Routine:", err);
      
//       alert("Exam Routine Not Saved. Check console for details.");
//     }
//   );
// }
// }

import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ExamModel } from '../../model/exam.model';
import { ExamserviceService } from '../../service/examservice.service';

@Component({
  selector: 'app-exam-routine-add',
  templateUrl: './exam-routine-add.component.html',
  styleUrls: ['./exam-routine-add.component.css']
})
export class ExamRoutineAddComponent implements OnInit {

  routineForm!: FormGroup;
  routineModel: ExamModel = new ExamModel();

  constructor(
    private formBuilder: FormBuilder,
    private routineService: ExamserviceService
  ) { }

  ngOnInit(): void {
    this.routineForm = this.formBuilder.group({
      exClass: ['', Validators.required],
      exTime: ['', Validators.required],
      exSubject1: ['', Validators.required],
      exSubject2: ['', Validators.required],
      exSubject3: ['', Validators.required],
      exSubject4: ['', Validators.required],
      exSubject5: ['', Validators.required],
      exSubject6: ['', Validators.required],
      exSubject7: ['', Validators.required],
      exdate1: ['', Validators.required],
      exdate2: ['', Validators.required],
      exdate3: ['', Validators.required],
      exdate4: ['', Validators.required],
      exdate5: ['', Validators.required],
      exdate6: ['', Validators.required],
      exdate7: ['', Validators.required],
    });
  }

  saveRoutine(): void {
    if (this.routineForm.invalid) {
      return;
    }

    this.setRoutineModelFrom();

    this.routineService.saveRoutine(this.routineModel)
      .subscribe(
        () => {
          this.routineForm.reset();
          alert("Exam Routine Saved");
        },
        (err) => {
          console.error("Error saving Routine:", err);
          alert("Exam Routine Not Saved. Check console for details.");
        }
      );
  }

  private setRoutineModelFrom(): void {
    this.routineModel.exClass = this.routineForm.value.exClass;
    this.routineModel.exTime = this.routineForm.value.exTime;
    this.routineModel.exSubject1 = this.routineForm.value.exSubject1;
    this.routineModel.exSubject2 = this.routineForm.value.exSubject2;
    this.routineModel.exSubject3 = this.routineForm.value.exSubject3;
    this.routineModel.exSubject4 = this.routineForm.value.exSubject4;
    this.routineModel.exSubject5 = this.routineForm.value.exSubject5;
    this.routineModel.exSubject6 = this.routineForm.value.exSubject6;
    this.routineModel.exSubject7 = this.routineForm.value.exSubject7;
    this.routineModel.exdate1 = this.routineForm.value.exdate1;
    this.routineModel.exdate2 = this.routineForm.value.exdate2;
    this.routineModel.exdate3 = this.routineForm.value.exdate3;
    this.routineModel.exdate4 = this.routineForm.value.exdate4;
    this.routineModel.exdate5 = this.routineForm.value.exdate5;
    this.routineModel.exdate6 = this.routineForm.value.exdate6;
    this.routineModel.exdate7 = this.routineForm.value.exdate7;
  }

}
