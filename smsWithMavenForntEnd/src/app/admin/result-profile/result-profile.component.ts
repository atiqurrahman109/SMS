import { Component, OnInit } from '@angular/core';
import { ResultAddService } from '../../service/result-add.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-result-profile',
  templateUrl: './result-profile.component.html',
  styleUrl: './result-profile.component.css'
})
export class ResultProfileComponent implements OnInit {



  constructor(private resultservice:ResultAddService, private route: ActivatedRoute,  private router: Router){}
  
  resultData: any;
  
  
  ngOnInit(): void {
   

    this.route.params.subscribe(params => {
      const id = params['id'];
      this.getAllById(id);
    });


  }
  getAllById(id: number): void {
    this.resultservice.getAllById(id).subscribe(result => {
      this.resultData = result;
    });
  }
}
