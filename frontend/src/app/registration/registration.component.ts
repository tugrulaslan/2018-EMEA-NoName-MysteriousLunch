import { Component, OnInit } from '@angular/core';
import { UserService } from "./../user.service";

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  users: Array<any>;
  user: any = {};
  
  constructor(private userService: UserService) { }

  ngOnInit() {
    this.userService.getUserBasicInfo('tugrul').subscribe((user: any) => {
      this.user = user;
    });
  }

}
