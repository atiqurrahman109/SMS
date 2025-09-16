import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ExamModel } from '../model/exam.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ExamserviceService {

  baseUrl:string = 'http://localhost:8082/admin/examrutine';

  constructor(private http: HttpClient) { }

  saveRoutine(data: ExamModel): Observable<ExamModel> {
    return this.http.post<ExamModel>(this.baseUrl, data);
  }


getAllRoutine(): Observable<ExamModel[]>{
  return this.http.get<ExamModel[]>(this.baseUrl)

}

deleteRoutine(id:number):Observable<void>{
  return this.http.delete<void>(`${this.baseUrl}/${id}`);
  
}

updateRoutine(id:number, data:ExamModel):Observable<ExamModel>{
  return this.http.put<ExamModel>(`${this.baseUrl}/${id}`,data);

}


getAllById(id: number): Observable<any> {
  return this.http.get<any>(`${this.baseUrl}/${id}`);
}
getAllByClass(stclass: string): Observable<ExamModel[]> {
  return this.http.get<ExamModel[]>(`${this.baseUrl}/class/${stclass}`);
}



}
