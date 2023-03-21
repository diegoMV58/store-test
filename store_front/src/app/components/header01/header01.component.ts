import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CartModalComponent } from '../cart-modal/cart-modal.component';

@Component({
  selector: 'app-header01',
  templateUrl: './header01.component.html',
  styleUrls: ['./header01.component.scss']
})
export class Header01Component {
  constructor(private modalService: NgbModal) {}
  openModal() {
    this.modalService.open(CartModalComponent);
  }
}
