// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IECommerce {
    function addProduct(uint256 _productId, string memory _name, uint256 _price) external;
    function getProduct(uint256 _productId) external view returns (uint256, string memory, uint256);
}

