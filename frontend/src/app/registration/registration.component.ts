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
  private user: any = {};
  private bio: string;

  private cuisineFormControl = new FormControl();
  private chosenCuisines: string[] = [];
  private cuisines: string[] = [];
  private filteredCuisines: Observable<string[]>;
  private interestFormControl = new FormControl();
  private chosenInterests: string[] = [];
  private interests: string[] = [];
  private filteredInterests: Observable<string[]>;

  constructor(private userService: UserService) {
  }

  ngOnInit() {
    this.userService.getUserBasicInfo('tugrul').subscribe((user: any) => {
      this.user = user;
    });

    this.userService.getAllCuisines().subscribe(
      res => {
        this.cuisines = res;
      }
    );

    this.filteredCuisines = this.cuisineFormControl.valueChanges.pipe(
      startWith(''),
      map(value => this.filterCuisines(value))
    );

    this.userService.getAllInterests().subscribe(
      res => {
        this.interests = res;
      }
    );

    this.filteredInterests = this.interestFormControl.valueChanges.pipe(
      startWith(''),
      map(value => this.filterInterests(value))
    );
  }

  private filterCuisines(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.cuisines.filter(option => option.toLowerCase().indexOf(filterValue) === 0);
  }

  private filterInterests(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.interests.filter(option => option.toLowerCase().indexOf(filterValue) === 0);
  }

  private selectedCuisine(selectedValue: string) {
    this.chosenCuisines.push(selectedValue);
  }

  private selectedInterest(selectedValue: string) {
    this.chosenInterests.push(selectedValue);
  }
}
