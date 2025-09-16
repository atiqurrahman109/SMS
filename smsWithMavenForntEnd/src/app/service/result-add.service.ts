import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ResultAddModel } from '../model/result.model';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ResultAddService {




  baseUrl:string = 'http://localhost:8082/admin/result';

  constructor(private http: HttpClient) { }

  saveResult(data: ResultAddModel): Observable<ResultAddModel> {
    return this.http.post<ResultAddModel>(this.baseUrl, data);
  }


getAllResult(): Observable<ResultAddModel[]>{
  return this.http.get<ResultAddModel[]>(this.baseUrl)

}

deleteResult(id:number):Observable<void>{
  return this.http.delete<void>(`${this.baseUrl}/${id}`);
  
}

updateResult(id:number, data:ResultAddModel):Observable<ResultAddModel>{
  return this.http.put<ResultAddModel>(`${this.baseUrl}/${id}`,data);

}


getAllById(id: number): Observable<any> {
  return this.http.get<any>(`${this.baseUrl}/${id}`);
}






}
