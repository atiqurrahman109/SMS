import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FeeCatagoryModel } from '../model/fee.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class FeeStudentService {

  baseUrl: string = "http://localhost:8082/admin/fee";

  constructor(private http: HttpClient) { }

  saveFee(data: FeeCatagoryModel): Observable<FeeCatagoryModel> {
    return this.http.post<FeeCatagoryModel>(this.baseUrl, data);
  }

  getAllFee(): Observable<FeeCatagoryModel[]> {
    return this.http.get<FeeCatagoryModel[]>(this.baseUrl);
  }
   getFeeByStudentId(sid: number): Observable<FeeCatagoryModel[]> {
    return this.http.get<FeeCatagoryModel[]>(`${this.baseUrl}/feest/${sid}`);
  }


    createFeeRecepit(): Observable<Blob> {
          return this.http.get(`${this.baseUrl}/generateReceipt`, { responseType: 'blob' });
     }

  deleteFee(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }

  updateFee(id: number, data: FeeCatagoryModel): Observable<FeeCatagoryModel> {
    return this.http.put<FeeCatagoryModel>(`${this.baseUrl}/${id}`, data);
  }
}
