# AWS Deployment Guide for Algobin Website

## Quick Start

1. **Extract and prepare**:
   ```bash
   unzip algobin-website.zip
   cd algobin-website-deploy
   chmod +x deploy-aws.sh
   ./deploy-aws.sh
   ```

## Deployment Options

### Option 1: AWS Amplify (Recommended)
Best for full-stack applications with automatic scaling.

**Steps**:
1. Push code to GitHub repository
2. Connect to AWS Amplify console
3. Configure build settings:
   - Build command: `npm run build`
   - Output directory: `dist`
   - Node version: 18+
4. Add environment variables:
   - `DATABASE_URL`: Your PostgreSQL connection string
   - `NODE_ENV`: production

### Option 2: AWS Elastic Beanstalk
Great for Node.js applications with managed infrastructure.

**Steps**:
1. Install EB CLI: `pip install awsebcli`
2. Initialize: `eb init`
3. Create environment: `eb create production`
4. Deploy: `eb deploy`

### Option 3: AWS EC2 + RDS
For complete control over infrastructure.

**Prerequisites**:
- RDS PostgreSQL database
- EC2 instance (Ubuntu 20.04+ recommended)

**Server Setup**:
```bash
# Install Node.js 18+
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 for process management
sudo npm install -g pm2

# Upload and extract your files
# Then run:
npm install
npm run build
npm run db:push
pm2 start "npm run start" --name algobin
pm2 startup
pm2 save
```

### Option 4: AWS ECS (Docker)
For containerized deployment.

Create `Dockerfile`:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 5000
CMD ["npm", "start"]
```

## Environment Configuration

Create `.env` file:
```env
DATABASE_URL=postgresql://username:password@your-rds-endpoint:5432/algobin
NODE_ENV=production
PORT=5000
```

## Database Setup

1. **Create RDS PostgreSQL instance**
2. **Update connection string in .env**
3. **Run database migration**:
   ```bash
   npm run db:push
   ```

## Domain and SSL

1. **Route 53**: Configure your domain
2. **ACM**: Request SSL certificate
3. **CloudFront**: Add CDN (optional)
4. **Application Load Balancer**: For high availability

## Monitoring and Logs

- **CloudWatch**: Application logs and metrics
- **X-Ray**: Distributed tracing (optional)
- **Health checks**: Configure in load balancer

## Cost Optimization

- Use **t3.micro** for EC2 (free tier eligible)
- **RDS db.t3.micro** for database (free tier)
- **CloudFront** for static assets caching
- **Auto Scaling** for traffic spikes

## Security Checklist

- ✅ Enable HTTPS only
- ✅ Configure security groups properly
- ✅ Use IAM roles instead of access keys
- ✅ Enable VPC for network isolation
- ✅ Regular security patches
- ✅ Database encryption at rest

## Troubleshooting

**Build fails**:
- Check Node.js version (18+ required)
- Verify all dependencies in package.json

**Database connection issues**:
- Verify DATABASE_URL format
- Check security group rules
- Ensure database is publicly accessible (if needed)

**Performance issues**:
- Enable gzip compression
- Use CloudFront CDN
- Optimize database queries
- Consider Redis for caching

## Support

For deployment assistance:
- Check AWS documentation
- Review CloudWatch logs
- Contact AWS support for infrastructure issues