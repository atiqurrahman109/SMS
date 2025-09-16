import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ResultAddModel } from '../../model/result.model';
import { ResultAddService } from '../../service/result-add.service';
import { StudntAddForm } from '../../model/student.model';
import { StudentAddService } from '../../service/student-add.service';

@Component({
  selector: 'app-student-result-add',
  templateUrl: './student-result-add.component.html',
  styleUrl: './student-result-add.component.css'
})
export class StudentResultAddComponent implements OnInit {


resultform !:FormGroup;
resultModel : ResultAddModel = new ResultAddModel();
resultsDataStore : any[]=[];
studentId:StudntAddForm[]=[];

constructor(
  private formBuilder :FormBuilder,
  private studentservice:StudentAddService,
  private resultservice :ResultAddService
){}

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

    this.loadResult();
    this.loadStudent();
    this.calculateResults();

  }

  setResultModelFrom(): void {    
  
    this.resultModel.rbangla = this.resultform.value.rbangla;
    this.resultModel.rmath = this.resultform.value.rmath;
    this.resultModel.renglish = this.resultform.value.renglish;
    this.resultModel.rislam = this.resultform.value.rislam;
    this.resultModel.rscince = this.resultform.value.rscince;
    this.resultModel.rsocial = this.resultform.value.rsocial;
    this.resultModel.rtotalmark = this.resultform.value.rtotalmark;
    this.resultModel.ravg = this.resultform.value.ravg;
    this.resultModel.rgpa = this.resultform.value.rgpa;
    this.resultModel.rgrade = this.resultform.value.rgrade;
    this.resultModel.rpassFail = this.resultform.value.rpassFail;
    this.resultModel.rexamcatagory = this.resultform.value.rexamcatagory;
    this.resultModel.studentAddModel = {
      sid: this.resultform.value.studentAddModel
    };
  

  }


private loadResult(){
  this.resultservice.getAllResult().subscribe(
    data => this.resultsDataStore = data,
    error => console.error('Error fetching Fee', error)
  );
  
  }
  
  private loadStudent() {
  this.studentservice.getAllStudents().subscribe(
    data => this.studentId = data,
    error => console.error('Error fetching Sid', error)
  );
  }
  

 saveResult() {
this.setResultModelFrom();
this.resultservice.saveResult(this.resultModel)
  .subscribe(
    (res) => {
      
      this.resultform.reset();
      alert("Fee Saved");      
    },
    (err) => {
      console.error("Error saving Result:", err);
      
      alert("Result Not Saved. Check console for details.");
    }
  );
}










// saveResult() {

//   this.setResultModelFrom();

//   this.resultservice.saveResult(this.resultModel)
//     .subscribe(
//       (res) => {
//         console.error("Error saving result:");        
//         alert("Result Not Saved. Check console for details.");
       
//       },
//       (err) => {

//         this.resultform.reset();
//         alert("result Saved");
       
//       }
//     );
// }


calculateResults() {
  const bangla = parseInt(this.resultform.get('rbangla')?.value) || 0;
  const english = parseInt(this.resultform.get('renglish')?.value) || 0;
  const math = parseInt(this.resultform.get('rmath')?.value) || 0;
  const science = parseInt(this.resultform.get('rscince')?.value) || 0;
  const social = parseInt(this.resultform.get('rsocial')?.value) || 0;
  const islam = parseInt(this.resultform.get('rislam')?.value) || 0;

  if (bangla < 33 || english < 33 || math < 33 || science < 33 || social < 33 || islam < 33) {
    const totalMarks = this.calculateTotalMark(bangla, english, math, science, social, islam);
    const average = this.calculateAverageMark(bangla, english, math, science, social, islam);

    this.resultform.patchValue({
      rtotalmark: totalMarks,
      ravg: average.toFixed(2),
      rgpa: 0.00,
      rgrade: 'F',
      rpassFail: 'Fail'
    });
  } else {
    const totalMarks = this.calculateTotalMark(bangla, english, math, science, social, islam);
    const average = this.calculateAverageMark(bangla, english, math, science, social, islam);
    const gpa = this.calculateGPA(average);
    const grade = this.calculateGrade(gpa);
    const summary = (gpa >= 1.0) ? "Pass" : "Fail";

    this.resultform.patchValue({
      rtotalmark: totalMarks,
      ravg: average.toFixed(2),
      rgpa: gpa.toFixed(2),
      rgrade: grade,
      rpassFail: summary
    });
  }
}
calculateTotalMark(bangla: number, english: number, math: number, science: number, social: number, islam: number) {
  return bangla + english + math + science + social + islam;
}

calculateAverageMark(bangla: number, english: number, math: number, science: number, social: number, islam: number) {
  const totalSubjects = 6; // Assuming 6 subjects
  return (bangla + english + math + science + social + islam) / totalSubjects;
}

calculateGrade(gpa:any) {
  if (gpa >= 5.0) {
    return 'A+';
  } else if (gpa >= 4) {
    return 'A';
  } else if (gpa >= 3.5) {
    return 'A-';
  } else if (gpa >= 3) {
    return 'B';
  } else if (gpa >= 2) {
    return 'C';
  } else if (gpa >= 1) {
    return 'D';
  } else {
    return 'F';
  }
}

calculateGPA(average:any) {
  if (average >= 80) {
    return 5.0;
  } else if (average >= 70) {
    return 4.0;
  } else if (average >= 60) {
    return 3.5;
  } else if (average >= 50) {
    return 3.0;
  } else if (average >= 40) {
    return 2.0;
  } else if (average >= 33) {
    return 1.0;
  } else {
    return 0.0;
  }
}

}