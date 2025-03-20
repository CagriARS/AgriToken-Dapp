# AgriToken-Dapp
Decentralized marketplace for farmers with a solution to make the agriculture market more stable.
Decentralized Agricultural Supply Chain DApp
Project Overview
The Decentralized Agricultural Supply Chain DApp leverages blockchain technology to empower farmers, enabling them to directly access markets, earn fair profits, and ensure transparency in transactions. By utilizing the AgriToken (an ERC20 utility token), the DApp creates a fair and traceable supply chain where consumers and farmers can interact directly, bypassing intermediaries.

Key Features
AgriToken (ERC20 Token): A utility token for all transactions within the platform.
User Roles: Farmers, Suppliers, and Service Providers each have distinct roles with role-based access control.
Product Registration: Allows farmers to register agricultural products on the blockchain, providing details such as product name, location, quality, and quantity.
Marketplace: A decentralized platform where registered products can be bought and sold directly between farmers, suppliers, and consumers.
Service Providers: Farmers can access necessary farming tools, seeds, and fertilizers listed by service providers and purchase them using AgriTokens.
Governance: A decentralized decision-making process where stakeholders can propose and vote on changes to the platform.
Motivation
Traditional agricultural supply chains often marginalize farmers, who produce the goods but receive unfair compensation due to middlemen. The lack of transparency in product origins and quality further complicates the process. This DApp aims to solve these problems by offering a decentralized solution that is transparent, traceable, and beneficial for all stakeholders in the agricultural market.

Key Components
AgriToken: A standard ERC20 token used for all platform transactions.
User Roles: Registers users with specific roles like Farmer, Supplier, and Service Provider.
Product Registration: Farmers can register their agricultural products and are rewarded with AgriTokens for each registration.
Marketplace: A platform for buying and selling agricultural products directly.
Service Providers: Allow farmers to buy services using AgriTokens for farming tools, seeds, fertilizers, etc.
Governance: A decentralized decision-making mechanism where stakeholders can propose, vote, and execute platform changes.
Demo Walkthrough
User Registration: Start by creating new users with different roles using UserRole.sol. The role is chosen using an enum (0, 1, 2, or 3).
Farmer Setup: Register a farmer and transfer some tokens to ProductRegister.sol using the transfer function of the AgriToken contract.
Product Registration: The farmer registers a new product (the product ID starts at 1 for the first registered product).
Marketplace Transaction: Using a supplier account, the product can be purchased from the marketplace by calling MarketPlace.sol.
Service Provider Setup: Optionally, create a Service Provider and explore the governance features to propose and vote on platform changes.
Conclusion
The Decentralized Agricultural Supply Chain DApp is a step toward revolutionizing agricultural markets by providing transparency, fair profits, and direct access to resources. It empowers farmers while ensuring that all transactions are traceable, secure, and transparent through the use of blockchain.
