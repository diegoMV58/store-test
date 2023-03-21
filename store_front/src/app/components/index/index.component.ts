import { Component, OnInit  } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http';
import { Products } from 'src/app/models/products';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { Observable } from 'rxjs';
@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.scss']
})
export class IndexComponent implements OnInit{
  private apiUrl = 'http://localhost:3000/';
  products: Products[] = [];
  stateAZ: number = 0;
  statePrice: number = 0;
  title: any = "";
  minval: any = "";
  maxval: any = "";
  constructor(private http: HttpClient,private route: ActivatedRoute,
    private router: Router ) { }

  ngOnInit() {
    this.http.get<Products[]>(`${this.apiUrl}products`).subscribe(data => {
    this.products = data
  });
  }
  orderby(param1: any, param2: any){
    if(param1 == "title"){
      this.stateAZ = param2;
    }else if(param1 == "price"){
      this.statePrice = param2;
    }
    this.http.get<Products[]>(`${this.apiUrl}products/search-by/${param1}/${param2}`).subscribe(data => {
      this.products = data
    });
  }
  filter(): void {

    const headers = new HttpHeaders({'Content-Type': 'application/json'});
    const url = `${this.apiUrl}products/filter`
    this.http.post<any>(url,  {title: this.title, minval: this.minval, maxval: this.maxval}, { headers }).subscribe(data => {
      this.products = data});
  }
  gotoProducts(id: number){
    this.router.navigate([`/product/${ id }`]);
  }
  clean(){
    this.http.get<Products[]>(`${this.apiUrl}products/search-by/price/1`).subscribe(data => {
      this.products = data
    });
    this.title = "";
    this.minval = "";
    this.maxval = "";
  }
}


