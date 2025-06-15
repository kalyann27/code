#!/bin/bash

# Algobin AWS Deployment Script
# This script helps deploy the Algobin website to AWS

echo "🚀 Algobin AWS Deployment Helper"
echo "================================="

# Check if required tools are installed
command -v aws >/dev/null 2>&1 || { echo "❌ AWS CLI is required but not installed. Install it first."; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ Node.js is required but not installed. Install it first."; exit 1; }

echo "✅ Prerequisites check passed"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the application
echo "🏗️  Building application..."
npm run build

echo "✅ Build completed successfully!"
echo ""
echo "📋 Next Steps for AWS Deployment:"
echo ""
echo "1. AWS Amplify (Recommended):"
echo "   - Create GitHub repository and push this code"
echo "   - Go to AWS Amplify Console"
echo "   - Connect your GitHub repository"
echo "   - Set build command: npm run build"
echo "   - Set output directory: dist"
echo ""
echo "2. AWS EC2 + RDS:"
echo "   - Set up RDS PostgreSQL database"
echo "   - Launch EC2 instance"
echo "   - Upload this folder to EC2"
echo "   - Run: npm install && npm run build && npm run start"
echo ""
echo "3. AWS S3 + CloudFront (Frontend only):"
echo "   - Upload dist/ folder contents to S3 bucket"
echo "   - Configure S3 for static website hosting"
echo "   - Set up CloudFront distribution"
echo ""
echo "📝 Don't forget to:"
echo "   - Set DATABASE_URL environment variable"
echo "   - Configure your domain name"
echo "   - Set up SSL certificate"
echo ""
echo "🎉 Your Algobin website is ready for AWS deployment!"