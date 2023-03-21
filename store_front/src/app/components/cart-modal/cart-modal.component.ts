import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Products } from 'src/app/models/products';

@Component({
  selector: 'app-cart-modal',
  templateUrl: './cart-modal.component.html',
  styleUrls: ['./cart-modal.component.scss']
})
export class CartModalComponent {
  private apiUrl = 'http://localhost:3000/';
  products: any[] = [];
  qnt: any[] = [];
  total = 0;
  loading = 0;
  success: number = 0;


  constructor(private http: HttpClient,private route: ActivatedRoute,
    private router: Router, public modal: NgbActiveModal, private modalService: NgbModal ) { }

    ngOnInit() {
      this.search();
    }
    search(){
      this.http.get<Products[]>(`${this.apiUrl}cart`).subscribe(data => {
        this.products = data;
        this.products.forEach((item) => {

          this.qnt[item.id] = item.quantity;
          this.total += (item.product.price * item.quantity);
        });
      });
    }
    delete(id: number) {
      this.http.delete<any>(`${this.apiUrl}cart/`+id).subscribe(data => {});
      setTimeout(() => {
      location.reload();
      },3000);
    }
    update(){
      return this.http.patch(`${this.apiUrl}cart/update`, this.qnt).subscribe(data => {
        this.total= 0;
        this.search();
        this.loading = 1;
    setTimeout(() => {
      this.loading = 0;

      },500);
      });

    }
    purchase(){
      const headers = new HttpHeaders({'Content-Type': 'application/json'});
      const url = `${this.apiUrl}/check-out`;
      this.http.post<any>(url,  {qnt: this.qnt}, { headers }).subscribe(data => {
      });
      this.success = 1;
      setTimeout(() => {
        location.reload();
      }, 4000);
    }
}
