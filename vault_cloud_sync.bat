@echo off
REM Vault Push Script for Markdown Files

echo Pushing updates to Vault...

REM Navigate to the correct directory (verify this part)
cd D:\knowledge-vault\vault

REM Check if we are in the correct directory
echo Current directory: %cd%

REM Ensure you're on the correct branch (adjust to your setup)
git checkout main

REM Stage all changes (Markdown files and other changes)
git add .

REM Commit the changes with a custom message
git commit -m "Updated vault with new Markdown files and other changes"

REM Push the changes to the GitHub repository
git push origin main

echo Vault pushed to GitHub successfully!
pause