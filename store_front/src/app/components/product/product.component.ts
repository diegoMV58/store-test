import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription, switchMap } from 'rxjs';
import { Products } from 'src/app/models/products';
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})

export class ProductComponent {

  private routeSub: Subscription = new Subscription;
  constructor(private http: HttpClient,private route: ActivatedRoute,
    private router: Router ) { }
    private apiUrl = 'http://localhost:3000/';
  product: any;
    id: number = 0;
    total: number = 0;
    qnt: number = 0;
    success: number = 0;
  ngOnInit() {
    this.routeSub = this.route.params.subscribe(params => {

      this.id = params['id'];

      this.getProduct(this.id);
    }
  );
  }
  getProduct(id: number){
    this.http.get<any>(`${this.apiUrl}products/${id}`).subscribe(data => {
      this.product = data;
  }
  );
  }
  totalQ(){
    this.total = this.product['price'] * this.qnt;
  }
  addToCart(): void {
    if(this.qnt >this.product['stock'] ){
      alert("the amount entered is greater than the amount available");
    }else{
    const headers = new HttpHeaders({'Content-Type': 'application/json'});
    const url = `${this.apiUrl}cart/add`;
    this.http.post<any>(url,  {id: this.id, qnt: this.qnt, total: this.total}, { headers }).subscribe(data => {
    });
    this.success = 1;
    setTimeout(() => {
      this.router.navigate([``]);
    }, 4000);

  }
  }
}

