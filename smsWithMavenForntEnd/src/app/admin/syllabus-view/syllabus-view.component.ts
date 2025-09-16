import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { SyllabusModel } from '../../model/syllabus.model';
import { SyllabusAddService } from '../../service/syllabus-add.service';

@Component({
  selector: 'app-syllabus-view',
  templateUrl: './syllabus-view.component.html',
  styleUrl: './syllabus-view.component.css'
})
export class SyllabusViewComponent implements OnInit{



  
  syllabus: SyllabusModel[] = [];

  constructor(
    private syllabusService: SyllabusAddService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.loadCuttingPlans();
  }

  loadCuttingPlans(): void {
    this.syllabusService.getAllSyllabus().subscribe({
      next: (data) => {
        this.syllabus = data;
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.error('Error loading Cutting Plans:', err);
      }
    });
  }


}
