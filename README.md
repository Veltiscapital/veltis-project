# Veltis - Biotech IP Tokenization Platform

![Veltis Logo](https://via.placeholder.com/200x100?text=Veltis)

## Overview

Veltis is a Web3 platform that enables users to create, fractionalize, list, and trade IP NFTs (Intellectual Property Non-Fungible Tokens) in a decentralized marketplace. The platform is specifically designed for the biotech industry, allowing researchers, institutions, and companies to tokenize their intellectual property, making it more accessible, tradable, and valuable.

## Project Structure

The Veltis project is organized into several repositories, each with a specific purpose:

1. **[veltis-frontend](https://github.com/Veltiscapital/veltis-frontend)** - React-based frontend application
2. **[veltis-backend](https://github.com/Veltiscapital/veltis-backend)** - Node.js API server
3. **[veltis-contracts](https://github.com/Veltiscapital/veltis-contracts)** - Solidity smart contracts
4. **[veltis-docs](https://github.com/Veltiscapital/veltis-docs)** - Project documentation

## Tech Stack

### Frontend
- React with TypeScript
- Vite
- Tailwind CSS
- Clerk for authentication
- Ethers.js for blockchain interaction
- Web3Modal for wallet connection

### Backend
- Node.js with Express
- PostgreSQL with Prisma ORM
- JWT authentication with Clerk integration
- IPFS via NFT.storage

### Smart Contracts
- Solidity
- Hardhat development framework
- OpenZeppelin contracts

### Infrastructure
- Vercel for frontend hosting
- Heroku for backend hosting
- Polygon blockchain (Amoy Testnet and Mainnet)

## Getting Started

To get started with the Veltis project, follow these steps:

1. Clone the repositories you want to work with:
   ```bash
   git clone https://github.com/Veltiscapital/veltis-frontend.git
   git clone https://github.com/Veltiscapital/veltis-backend.git
   git clone https://github.com/Veltiscapital/veltis-contracts.git
   git clone https://github.com/Veltiscapital/veltis-docs.git
   ```

2. Follow the setup instructions in each repository's README file.

## Deployment

### Frontend Deployment
The frontend is deployed to Vercel. Use the `deploy-to-vercel.sh` script in the frontend repository:
```bash
cd veltis-frontend
./deploy-to-vercel.sh
```

### Backend Deployment
The backend is deployed to Heroku. Follow the instructions in the backend repository's README.

### Smart Contracts Deployment
Smart contracts are deployed to the Polygon blockchain. Follow the instructions in the contracts repository's README.

## Development Workflow

1. Create a new branch for your feature or bugfix
2. Make your changes
3. Submit a pull request to the appropriate repository
4. After review, your changes will be merged into the main branch

## Version Information

Current version: 0.1.0

We use semantic versioning:
- **Major version (X.0.0)**: Breaking changes
- **Minor version (0.X.0)**: New features without breaking changes
- **Patch version (0.0.X)**: Bug fixes and small improvements

## Contributing

We welcome contributions to the Veltis project! Please read the contributing guidelines in each repository before submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file in each repository for details.

## Contact

For questions or support, please contact:
- Email: contact@veltiscapital.com
- Twitter: [@VeltisCapital](https://twitter.com/VeltisCapital)
- Discord: [Veltis Community](https://discord.gg/veltis)
