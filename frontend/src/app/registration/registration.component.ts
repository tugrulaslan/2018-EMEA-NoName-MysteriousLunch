import {Component, OnInit} from '@angular/core';
import {UserService} from './../user.service';
import {map, startWith} from 'rxjs/operators';
import {FormControl} from '@angular/forms';
import {Observable} from 'rxjs';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  private chosenCuisines: string[] = [];
  user: any = {};
  myControl = new FormControl();
  cuisines: string[] = [];
  filteredCuisines: Observable<string[]>;

  constructor(private userService: UserService) {
  }

  ngOnInit() {
    this.userService.getAllCuisines().subscribe(
      res => {
        this.cuisines = res;
      }
    );

    this.filteredCuisines = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => this.filterCuisines(value))
    );

    this.userService.getUserBasicInfo('tugrul').subscribe((user: any) => {
      this.user = user;
    });
  }

  private filterCuisines(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.cuisines.filter(option => option.toLowerCase().indexOf(filterValue) === 0);
  }

  private selectedCuisine(selectedValue: string) {
    this.chosenCuisines.push(selectedValue);
  }
}
