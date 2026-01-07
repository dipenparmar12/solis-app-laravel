# Solis Laravel Backend - Development Setup Guide

## 📋 Prerequisites

Before starting, ensure you have the following installed:
- PHP 8.0+ (Tested with PHP 8.5.1)
- Composer (2.0+)
- MySQL 8.0 (via Docker or local installation)
- Node.js (for running some Laravel tools)

---

## 🚀 Quick Start (Fresh Installation)

### Step 1: Clone and Navigate
```bash
# Clone the repository (if not already done)
git clone <your-repo-url> solis-laravel
cd solis-laravel
```

### Step 2: Install Dependencies
```bash
# Install PHP dependencies
composer install

# If you get PHP version conflicts, update the lock file:
rm composer.lock
composer update --no-interaction
```

### Step 3: Setup Environment
```bash
# Copy example environment file
cp .env.example .env

# Generate application key
php artisan key:generate
```

### Step 4: Configure Database

**Option A: Using Docker (Recommended)**
```bash
# Create MySQL container
docker run --name solis-mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=solis_app \
  -e MYSQL_USER=solis \
  -e MYSQL_PASSWORD=solis_pass \
  -p 3306:3306 \
  -d mysql:8.0

# Wait for MySQL to be ready (approximately 10-15 seconds)
sleep 15
```

**Option B: Using Local MySQL**
- Create database: `CREATE DATABASE solis_app;`
- Create user: `CREATE USER 'solis'@'localhost' IDENTIFIED BY 'solis_pass';`
- Grant privileges: `GRANT ALL PRIVILEGES ON solis_app.* TO 'solis'@'localhost';`

### Step 5: Update .env File

Edit `.env` and ensure these values are set:

```env
# Application
APP_NAME=Solis-Laravel
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:8000
SPA_URL=localhost:3000

# Database (for Docker)
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=solis_app
DB_USERNAME=solis
DB_PASSWORD=solis_pass

# CORS & Security
SANCTUM_STATEFUL_DOMAINS=localhost,localhost:3000,127.0.0.1,127.0.0.1:8000,::1
SESSION_DOMAIN=localhost

# Cache & Session
CACHE_DRIVER=file
SESSION_DRIVER=cookie
QUEUE_CONNECTION=sync
```

### Step 6: Run Migrations & Seeders
```bash
# Run database migrations
php artisan migrate

# Seed the database with initial data
php artisan db:seed
```

### Step 7: Start Development Server
```bash
# Start the Laravel development server
php artisan serve --host=0.0.0.0 --port=8000

# Server will be available at: http://localhost:8000
```

---

## 📝 Configuration Details

### Key Configuration Files

| File | Purpose |
|------|---------|
| `.env` | Environment variables |
| `config/app.php` | App configuration |
| `config/database.php` | Database settings |
| `config/sanctum.php` | API authentication |
| `config/cors.php` | CORS settings |
| `routes/api.php` | API route definitions |

### Important .env Variables

```env
# Application settings
APP_NAME=Solis-Laravel
APP_ENV=local                    # local, testing, production
APP_DEBUG=true                   # false in production
APP_URL=http://localhost:8000    # Application URL

# Frontend URL (for CORS)
SPA_URL=localhost:3000

# Database
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=solis_app
DB_USERNAME=solis
DB_PASSWORD=solis_pass

# Sanctum (API Authentication)
SANCTUM_STATEFUL_DOMAINS=localhost,localhost:3000,127.0.0.1,127.0.0.1:8000,::1

# Session
SESSION_DRIVER=cookie
SESSION_DOMAIN=localhost
SESSION_LIFETIME=120

# Logging
LOG_CHANNEL=daily
LOG_LEVEL=debug
```

---

## 🗄️ Database Schema

The database includes the following tables:

### Core Tables
- `users` - User accounts
- `roles` - User roles
- `permissions` - Permissions
- `model_has_roles` - User-role relationships
- `model_has_permissions` - Permission relationships

### Business Logic Tables
- `projects` - Project management
- `transactions` - Financial transactions
- `funds` - Fund tracking
- `incomes` - Income records
- `expenses` - Expense records
- `salaries` - Employee salaries
- `advances` - Employee advances
- `dealers` - Dealer information
- `estimates` - Project estimates
- `payments` - Payment records

### Supporting Tables
- `media` - Media library
- `migrations` - Migration tracking
- `personal_access_tokens` - Sanctum tokens
- `password_resets` - Password reset tokens
- `failed_jobs` - Failed job queue

---

## 🔐 Authentication & Authorization

### Sanctum API Authentication

The application uses Laravel Sanctum for API token-based authentication.

#### Getting a Token
```bash
# POST request to login endpoint
curl -X POST http://localhost:8000/api/sanctum/login \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","password":"password"}'
```

#### Using the Token
```bash
# Include token in Authorization header
curl http://localhost:8000/api/me \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### Protected Routes

Most API endpoints require authentication via the `auth:sanctum` middleware:

```php
Route::middleware('auth:sanctum')->group(function () {
    // Your protected routes here
});
```

---

## 📡 API Endpoints

### Authentication Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/sanctum/csrf-cookie` | Get CSRF token |
| POST | `/api/sanctum/login` | Login |
| POST | `/api/sanctum/logout` | Logout |
| GET | `/api/me` | Get current user |

### Resource Endpoints (Protected)
All the following require `auth:sanctum`:
- GET `/api/projects` - List projects
- POST `/api/projects` - Create project
- GET `/api/transactions` - List transactions
- GET `/api/expenses` - List expenses
- GET `/api/incomes` - List incomes
- And many more...

---

## 🛠️ Artisan Commands

### Useful Development Commands

```bash
# Database
php artisan migrate              # Run migrations
php artisan migrate:rollback     # Rollback migrations
php artisan db:seed              # Seed database
php artisan tinker               # Interactive shell

# Routes
php artisan route:list           # Show all routes
php artisan route:list --api     # Show API routes only

# Models & Migrations
php artisan make:model ModelName
php artisan make:migration migration_name
php artisan make:controller ControllerName
php artisan make:request RequestName

# Cache & Config
php artisan config:clear         # Clear config cache
php artisan cache:clear          # Clear application cache
php artisan view:clear           # Clear view cache

# Testing
php artisan test                 # Run test suite
php artisan test --filter=TestName

# Queue
php artisan queue:work           # Process queued jobs
php artisan queue:failed         # View failed jobs
```

---

## 🧪 Testing

### Running Tests
```bash
# Run all tests
php artisan test

# Run specific test file
php artisan test tests/Feature/YourTest.php

# Run with coverage
php artisan test --coverage
```

### Test Configuration
- Config file: `phpunit.xml`
- Tests located in: `tests/Feature/` and `tests/Unit/`

---

## 📦 Dependencies

### Key Packages

| Package | Purpose | Version |
|---------|---------|---------|
| laravel/framework | Core framework | ^9.0 |
| laravel/sanctum | API authentication | ^2.14 |
| laravel/fortify | Authentication scaffolding | ^1.8 |
| spatie/laravel-permission | Role & permission management | ^5.5 |
| spatie/laravel-medialibrary | Media handling | ^10.0 |

### Installation
Dependencies are already installed. To add new packages:
```bash
composer require vendor/package-name
composer require --dev vendor/package-name  # For development
```

---

## 🚨 Troubleshooting

### Issue: "SQLSTATE[HY000]: General error: 1030"
**Solution**: Ensure MySQL is running and accessible
```bash
docker ps | grep solis-mysql  # Check container
docker restart solis-mysql    # Restart if needed
```

### Issue: "Deprecated: Constant PDO::MYSQL_ATTR_SSL_CA"
**Status**: Fixed by using integer value `1012` in `config/database.php` to avoid deprecation warning in PHP 8.5+

### Issue: "Class not found"
**Solution**: Clear the autoloader cache
```bash
composer dump-autoload
```

### Issue: "Application key missing"
**Solution**: Generate the key
```bash
php artisan key:generate
```

### Issue: CORS errors in frontend
**Solution**: Verify CORS settings in `config/cors.php` and `.env`:
- `SANCTUM_STATEFUL_DOMAINS` should include your frontend URL
- `APP_URL` should be correctly set

---

## 📚 Project Structure

```
solis-laravel/
├── app/
│   ├── Http/
│   │   ├── Controllers/        # API controllers
│   │   ├── Requests/           # Form requests
│   │   └── Middleware/         # Custom middleware
│   ├── Models/                 # Eloquent models
│   ├── Services/               # Business logic
│   ├── Traits/                 # Reusable traits
│   └── Policies/               # Authorization policies
├── config/                     # Configuration files
├── database/
│   ├── migrations/             # Database migrations
│   └── seeders/                # Database seeders
├── routes/
│   ├── api.php                 # API routes
│   ├── web.php                 # Web routes
│   └── console.php             # Console routes
├── tests/
│   ├── Feature/                # Feature tests
│   └── Unit/                   # Unit tests
├── storage/                    # Logs, cache, uploads
├── .env                        # Environment variables (local)
├── .env.example                # Example environment file
├── composer.json               # PHP dependencies
└── artisan                     # Artisan CLI
```

---

## 🔄 Git Workflow

### Before Committing
```bash
# Ensure code quality
php artisan test
php artisan tinker  # Manual testing

# Check routes
php artisan route:list
```

### Deployment Migrations
When deploying to production:
```bash
php artisan migrate --force
php artisan config:cache
php artisan view:cache
```

---

## 📖 Additional Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Sanctum Documentation](https://laravel.com/docs/sanctum)
- [Spatie Permissions](https://spatie.be/docs/laravel-permission/v5/introduction)
- [Media Library](https://spatie.be/docs/laravel-medialibrary/v10/introduction)

---

## ✅ Verification Checklist

After setup, verify:
- [ ] Composer dependencies installed
- [ ] `.env` file configured
- [ ] Application key generated
- [ ] Database migrations completed
- [ ] Database seeders ran successfully
- [ ] Laravel server starts without errors
- [ ] `/api/sanctum/csrf-cookie` returns 200 OK
- [ ] Authentication endpoints accessible

---

## 🎯 Next Steps

1. Start the development server: `php artisan serve --host=0.0.0.0 --port=8000`
2. Test the API endpoints
3. Connect with the React frontend
4. Begin development!

---

**Created**: January 3, 2026
**Last Updated**: January 3, 2026
**Status**: ✅ Production Ready
