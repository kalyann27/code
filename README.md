# Algobin - Professional Software Development Platform

A comprehensive full-stack web application for a custom software development company, featuring enterprise-focused messaging, advanced AI chatbot, and responsive design optimized for Fortune 500 clients.

## Features

- **Modern React Frontend**: Built with React 18, TypeScript, and Tailwind CSS
- **Enterprise AI Chatbot**: Contextual problem-solving insights without external API dependencies
- **Responsive Design**: Mobile-optimized with corporate blue color scheme
- **Contact & Booking System**: Professional consultation scheduling
- **Micro-Interaction Design**: Intuitive hover effects and smooth animations
- **Database Integration**: PostgreSQL with Drizzle ORM

## Technology Stack

- **Frontend**: React 18, TypeScript, Vite, Tailwind CSS
- **Backend**: Node.js, Express, TypeScript
- **Database**: PostgreSQL with Drizzle ORM
- **UI Components**: Shadcn/ui with Radix UI primitives
- **State Management**: TanStack Query
- **Routing**: Wouter

## AWS Deployment Guide

### Option 1: AWS Amplify (Recommended for Full-Stack Apps)

1. **Prepare the build**:
   ```bash
   npm install
   npm run build
   ```

2. **Deploy to AWS Amplify**:
   - Upload the entire project folder to GitHub
   - Connect GitHub repo to AWS Amplify
   - Configure build settings:
     - Build command: `npm run build`
     - Output directory: `dist`
     - Node version: 18

3. **Environment Variables**:
   Set these in Amplify console:
   - `DATABASE_URL`: Your PostgreSQL connection string
   - `NODE_ENV`: production

### Option 2: AWS EC2 + RDS

1. **Set up RDS PostgreSQL database**
2. **Launch EC2 instance** (Ubuntu 20.04 LTS recommended)
3. **Install dependencies**:
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   sudo apt-get install -y nodejs
   sudo npm install -g pm2
   ```

4. **Deploy application**:
   ```bash
   # Upload and extract your zip file
   npm install
   npm run build
   npm run db:push  # Set up database schema
   pm2 start "npm run start" --name algobin
   ```

### Option 3: AWS S3 + CloudFront (Static Hosting)

For frontend-only deployment:

1. **Build the frontend**:
   ```bash
   npm run build
   ```

2. **Upload dist/ folder to S3 bucket**
3. **Configure CloudFront distribution**
4. **Set up custom domain** (optional)

## Environment Variables

Create a `.env` file with:

```env
DATABASE_URL=postgresql://username:password@host:port/database
NODE_ENV=production
PORT=5000
```

## Local Development

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Set up database**:
   ```bash
   npm run db:push
   ```

3. **Start development server**:
   ```bash
   npm run dev
   ```

## Build Commands

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run db:push` - Push database schema changes

## Project Structure

```
algobin-website-deploy/
├── client/              # React frontend
│   ├── src/
│   │   ├── components/  # UI components
│   │   ├── pages/       # Page components
│   │   ├── hooks/       # Custom hooks
│   │   └── utils/       # Utility functions
├── server/              # Express backend
│   ├── routes.ts        # API routes
│   ├── storage.ts       # Database layer
│   └── index.ts         # Server entry point
├── shared/              # Shared types and schemas
└── attached_assets/     # Static assets
```

## Support

For deployment assistance or customization, contact your development team.

## License

Proprietary - Algobin Software Development Platform