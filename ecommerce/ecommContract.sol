contract Ecommerce {

    struct Product {
        string title;
        string desc;
        address payable seller;
        uint productId;
        uint price;
        address buyer;
        bool delivered;
    }

    uint counter = 1;

    Product[] public products;
    event registered(string title, uint productId, address seller);
    event bought(uint productId, address buyer);
    event delivered(uint productId);


    function registerProduct(string memory _title, string memory _desc, uint _price) public {
        require(_price > 0, "Price should be greater than zero" );
        Product memory tempProduct;
        tempProduct.title = _title;
        tempProduct.desc = _desc;
        tempProduct.price = _price * 10 ** 18;
        tempProduct.seller = payable(msg.sender);
        tempProduct.productId = counter;
        products.push(tempProduct);
        counter++;
        emit registered(_title, tempProduct.productId, msg.sender);
    }   

    function buy(uint _productId) payable public {
        require(products[_productId-1].price == msg.value, "Please pay the exact price");
        require(products[_productId-1].seller!=msg.sender, "Seller cannot be the buyer");
        products[_productId-1].buyer = msg.sender;
        emit bought(_productId, msg.sender);
    }

    function delivery(uint _productId) public{
        require(products[_productId-1].buyer == msg.sender, "Only buyer can confirm it");
        products[_productId - 1].delivered = true;
        products[_productId - 1].seller.transfer(products[_productId].price);   
        emit delivered(_productId);     
    }
    


    

}