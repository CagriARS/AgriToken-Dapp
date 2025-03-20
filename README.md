# Decentralized Agricultural Supply Chain DApp

## Project Overview

The **Decentralized Agricultural Supply Chain DApp** utilizes blockchain technology to empower farmers by providing them direct access to markets, ensuring fair profits, and enhancing transparency in the agricultural supply chain. Through the use of the **AgriToken** (an ERC20 utility token), this platform facilitates a fair, decentralized, and traceable system where consumers and farmers can interact directly, eliminating intermediaries.

## Key Features

- **AgriToken (ERC20 Token)**: A utility token used for all transactions within the platform.
- **User Roles**: Includes distinct roles like Farmers, Suppliers, and Service Providers with role-based access control.
- **Product Registration**: Farmers can register agricultural products on the blockchain, with details like name, location, quality, and quantity.
- **Marketplace**: A decentralized marketplace for buying and selling registered agricultural products directly between farmers, suppliers, and consumers.
- **Service Providers**: Allows farmers to purchase farming tools, seeds, and fertilizers using AgriTokens.
- **Governance**: A decentralized decision-making process where platform changes are proposed, voted on, and executed by stakeholders.

## Motivation

The traditional agricultural supply chain often marginalizes farmers, who are the primary producers but do not receive fair compensation due to middlemen. Consumers also lack transparency regarding product origins and quality. This DApp provides a decentralized, transparent, and fair solution, ensuring equitable access and profit distribution.

## Key Components

1. **AgriToken**: An ERC20 token used for all platform transactions.
2. **User Roles**: Farmers, Suppliers, and Service Providers with access control based on roles.
3. **Product Registration**: Allows farmers to register their agricultural products and receive AgriTokens for each registration.
4. **Marketplace**: A decentralized platform where products can be bought and sold directly between farmers and suppliers/consumers.
5. **Service Providers**: Facilitates the purchase of necessary resources (tools, seeds, fertilizers) using AgriTokens.
6. **Governance**: Enables decentralized decision-making by allowing stakeholders to propose, vote, and execute platform changes.

## Demo Walkthrough

1. **User Registration**: Create new users with different roles using `UserRole.sol` (roles are chosen via an enum: 0, 1, 2, or 3).
2. **Farmer Setup**: Register a farmer and transfer some tokens to the `ProductRegister.sol` contract using the `transfer` function of the AgriToken contract.
3. **Product Registration**: The farmer can register a product (the first product will have ID 1).
4. **Marketplace Transaction**: Suppliers can buy products from the marketplace by interacting with `MarketPlace.sol`.
5. **Service Provider Setup**: Service Providers can list their services, and farmers can purchase these services using AgriTokens.
6. **Governance Features**: Stakeholders can create proposals, vote on them, and execute them if they receive sufficient support.

## Conclusion

The **Decentralized Agricultural Supply Chain DApp** offers a solution that empowers farmers by providing them with direct access to markets, fair profits, and transparency in the agricultural supply chain. With the use of blockchain technology, it ensures traceability, security, and fairness in every transaction.

