import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';
import { User } from "./user";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private GET_USER_DATA_URL = 'http://localhost:8080/api/v1/users/username=';
  private GET_ALL_CUISINES_URL = 'http://localhost:8080/api/v1/cuisines';
  private SEARCH_CUISINE_DATA_URL = 'http://localhost:8080/api/v1/cuisines/';

  constructor(private http: HttpClient) { }
  
  getAll(): Observable<any> {
    return this.http.get(this.GET_ALL_CUISINES_URL);
  }

 getAllCuisines(): Observable<any> {
    return this.http.get(this.GET_ALL_CUISINES_URL);
 }


  getUserBasicInfo(username: string): Observable<Object> {
    return this.http.get(`${this.GET_USER_DATA_URL}${username}`);
  }

  searchCuisines(cuisinename: string): Observable<Object> {
    return this.http.get(`${this.SEARCH_CUISINE_DATA_URL}${cuisinename}`);
  }
}
