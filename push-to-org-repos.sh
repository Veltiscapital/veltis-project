#!/bin/bash

# Script to push code from temporary repositories to Veltiscapital organization repositories
# Usage: ./push-to-org-repos.sh

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git and try again."
    exit 1
fi

echo "===== GitHub Authentication ====="
echo "This script requires authentication with GitHub."
echo "You can use a Personal Access Token (PAT) for HTTPS authentication."
echo "If you don't have a PAT, create one at: https://github.com/settings/tokens"
echo "Make sure your PAT has 'repo' permissions."
echo ""
echo "When prompted for your password during git operations, use your PAT instead of your GitHub password."
echo "============================="

# Function to push a repository to the organization
push_repo() {
    local temp_repo=$1
    local org_repo=$2
    
    echo "Pushing $temp_repo to Veltiscapital/$org_repo..."
    
    # Clone the temporary repository
    echo "Cloning rodrigomacias/$temp_repo..."
    if ! git clone https://github.com/rodrigomacias/$temp_repo.git temp_clone; then
        echo "Error: Failed to clone rodrigomacias/$temp_repo."
        return 1
    fi
    
    cd temp_clone || { echo "Error: Failed to change directory to temp_clone."; return 1; }
    
    # Add the organization repository as a remote
    echo "Adding remote for Veltiscapital/$org_repo..."
    git remote add organization https://github.com/Veltiscapital/$org_repo.git
    
    # Push to the organization repository
    echo "Pushing to Veltiscapital/$org_repo..."
    if git push -f organization main:main; then
        echo "Successfully pushed $temp_repo to Veltiscapital/$org_repo"
    else
        echo "Failed to push $temp_repo to Veltiscapital/$org_repo"
        echo "Make sure you have the necessary permissions and the repository exists."
        cd ..
        rm -rf temp_clone
        return 1
    fi
    
    # Clean up
    cd ..
    rm -rf temp_clone
    return 0
}

# Main execution
echo "Starting to push repositories to Veltiscapital organization..."
echo "Make sure you have created the following repositories in the Veltiscapital organization:"
echo "- veltis-frontend"
echo "- veltis-backend"
echo "- veltis-contracts"
echo "- veltis-docs"
echo "- veltis-project"
echo ""

# Ask for confirmation
read -p "Have you created all the repositories in the Veltiscapital organization? (y/n): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
    echo "Please create the repositories first and then run this script again."
    exit 1
fi

# Push each repository
success_count=0
failure_count=0

echo "Pushing veltis-frontend-temp to Veltiscapital/veltis-frontend..."
if push_repo "veltis-frontend-temp" "veltis-frontend"; then
    ((success_count++))
else
    ((failure_count++))
fi

echo "Pushing veltis-backend-temp to Veltiscapital/veltis-backend..."
if push_repo "veltis-backend-temp" "veltis-backend"; then
    ((success_count++))
else
    ((failure_count++))
fi

echo "Pushing veltis-contracts-temp to Veltiscapital/veltis-contracts..."
if push_repo "veltis-contracts-temp" "veltis-contracts"; then
    ((success_count++))
else
    ((failure_count++))
fi

echo "Pushing veltis-docs-temp to Veltiscapital/veltis-docs..."
if push_repo "veltis-docs-temp" "veltis-docs"; then
    ((success_count++))
else
    ((failure_count++))
fi

echo "Pushing veltis-project-temp to Veltiscapital/veltis-project..."
if push_repo "veltis-project-temp" "veltis-project"; then
    ((success_count++))
else
    ((failure_count++))
fi

echo "Push operation completed."
echo "Successful pushes: $success_count"
echo "Failed pushes: $failure_count"

if [ $success_count -eq 5 ]; then
    echo "All repositories have been successfully pushed to the Veltiscapital organization."
    echo "Next steps:"
    echo "1. Set up CI/CD pipelines for each repository"
    echo "2. Configure environment variables in deployment platforms"
    echo "3. Set up branch protection rules in GitHub"
    echo "4. Invite team members to the organization"
else
    echo "Some repositories failed to push. Please check the error messages above."
fi

exit 0 