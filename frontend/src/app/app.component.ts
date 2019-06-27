import { Component } from '@angular/core';
import { FormControl } from "@angular/forms";
import { FormGroup } from "@angular/forms";
import { FormBuilder } from "@angular/forms";
import { Validators } from "@angular/forms";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontend';
  firstFormGroup: FormGroup;
   secondFormGroup: FormGroup;
   constructor(private _formBuilder: FormBuilder) {}
   ngOnInit() {
      this.firstFormGroup = this._formBuilder.group({
         firstCtrl: ['', Validators.required]
      });
      this.secondFormGroup = this._formBuilder.group({
         secondCtrl: ['', Validators.required]
      });
   }
}
