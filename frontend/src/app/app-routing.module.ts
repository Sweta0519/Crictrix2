import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {HomeComponent} from "./home/home.component";
import {FlashhandbookComponent} from "./flashhandbook/flashhandbook.component";

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'handbooks', component: FlashhandbookComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
