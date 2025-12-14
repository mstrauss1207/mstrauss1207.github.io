# Setup Instructions for mstrauss.com

## Problem

The `jekyll-scholar` plugin (which provides the `{% bibliography %}` tag) is not working, causing the about page to break when trying to display selected publications.

## Solution

You have two deployment options:

### Option 1: Deploy with GitHub Actions (Recommended)

This is already set up! The `.github/workflows/deploy.yml` file has been created.

**Steps:**

1. Go to your GitHub repository: https://github.com/mstrauss1207/mstrauss1207.github.io
2. Navigate to **Settings** → **Pages**
3. Under "Build and deployment" → "Source", select **"GitHub Actions"**
4. Push your changes (including the `.github/workflows/deploy.yml` file)
5. The site will automatically build and deploy with full plugin support

### Option 2: Build Locally (For Development)

If you want to test locally before pushing:

#### Step 1: Install Homebrew Ruby (System Ruby is too old)

```bash
# Install rbenv (Ruby version manager)
brew install rbenv ruby-build

# Install Ruby 3.2
rbenv install 3.2.2
rbenv global 3.2.2

# Add to your ~/.zshrc (if not already there)
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
source ~/.zshrc

# Verify
ruby --version  # Should show 3.2.2
```

#### Step 2: Install Dependencies

```bash
cd /Users/mstrauss/Documents/code/mstrauss.com

# Install bundler
gem install bundler:2.7.2

# Install all gems from Gemfile
bundle install
```

#### Step 3: Build and Serve Locally

```bash
# Clean previous builds
bundle exec jekyll clean

# Build and serve
bundle exec jekyll serve --livereload

# Open http://localhost:4000 in your browser
```

## What Was Fixed

1. **Created `.github/workflows/deploy.yml`**: This workflow builds your site with full plugin support on GitHub Actions
2. **Fixed `_includes/selected_papers.liquid`**: Corrected the bibliography query syntax from `@*[selected=true]*` to `@*[selected=true]`

## Your Selected Publications

The following papers in your `_bibliography/pubs.bib` are marked as `selected={true}` and will appear on the about page:

1. FlowMAC: Conditional Flow Matching for Audio Coding at Low Bit Rates (ICASSP 2025)
2. Inference-Adaptive Steering of Neural Networks for Real-Time Area-Based Sound Source Separation (IEEE Signal Processing Letters 2025)
3. SEFGAN: Harvesting the Power of Normalizing Flows and GANs for Efficient High-Quality Speech Enhancement (WASPAA 2023)
4. DREGON: Dataset and Methods for UAV-Embedded Sound Source Localization (IROS 2018)

## Quick Start (Easiest)

If you just want to deploy to GitHub Pages without building locally:

```bash
cd /Users/mstrauss/Documents/code/mstrauss.com
git add .
git commit -m "Enable GitHub Actions deployment and fix selected papers"
git push
```

Then enable GitHub Actions in your repository settings as described above.
