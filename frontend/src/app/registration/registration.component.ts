import { Component, OnInit } from '@angular/core';
import { UserService } from "./../user.service";
import {map, startWith} from 'rxjs/operators';
import {FormControl} from '@angular/forms';
import {Observable} from 'rxjs';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  users: Array<any>;
  chosenCuisines: string[] = [];
  user: any = {};
  myControl = new FormControl();
  options: string[] = [];
  filteredOptions: Observable<string[]>;

  constructor(private userService: UserService) { }

  ngOnInit() {
	this.userService.getAllCuisines().subscribe(
			res => {this.options = res}
	);
   this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value))
    );
    this.userService.getUserBasicInfo('tugrul').subscribe((user: any) => {
      this.user = user;
    });
  }
  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.options.filter(option => option.toLowerCase().indexOf(filterValue) === 0);
  }

  private selected(selectedValue: string) {
		this.chosenCuisines.push(selectedValue);
  }
}