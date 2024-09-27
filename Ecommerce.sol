// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './IECommerce.sol' ;

contract ECommerce is IECommerce {
    // User structure
    struct User {
        address userAddress;
        string username;
        string role; // Buyer, Seller, Admin
    }

    // Product structure
    struct Product {
        uint256 productId;
        string name;
        //string description;
        uint256 price;
        //uint256 stock;
    }

    // Order structure
    struct Order {
        uint256 orderId;
        uint256 productId;
        address buyer;
        uint256 quantity;
        string status; // Pending, Shipped, Delivered, Canceled
    }

    // Mappings
    mapping(address => User) public users; // User management
    mapping(uint256 => Product) public products; // Product management
    mapping(uint256 => Order) public orders; // Order management

    // Events
    event ProductAdded(uint256 indexed productId, string name, uint256 price);
    event OrderCreated(uint256 indexed orderId, uint256 indexed productId, address indexed buyer);
    
     // Correctly overrides the interface function
    function addProduct(uint256 _productId, string memory _name, uint256 _price) public override {
        products[_productId] = Product(_productId, _name, _price);
    }
 
// Ensure this matches the interface signature exactly uint256, string memory, uint256
    function getProduct(uint256 _productId) public view override returns (uint256, string memory, uint256) {
        Product memory product = products[_productId];
        return (product.productId, product.name, product.price);
    }
    
}