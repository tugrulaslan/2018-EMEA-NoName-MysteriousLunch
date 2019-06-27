import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private GET_USER_DATA_URL = 'http://localhost:8080/api/v1/users/username=';

  constructor(private http: HttpClient) { }
  
  getAll(): Observable<any> {
    return this.http.get('http://localhost:8080/api/v1/users');
  }

  getUserBasicInfo(username: string): Observable<Object> {
    return this.http.get(`${this.GET_USER_DATA_URL}${username}`);
  }
}
