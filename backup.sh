#!/bin/bash
CLIENT_NAME="recruitment-agents"
REPO_PATH="/root/recruitment-agents"

# 1. Update the repo (pull latest)
cd $REPO_PATH
git pull origin main

# 2. Run the export script, targeting the specific folder inside the repo
# Note: You might need to tweak the OUTPUT_DIR in the JS script or move files after export.
# Here is a simple move strategy:
cd ~/n8n-gitops
node export_project.js "$CLIENT_NAME"

# 3. Move files to the real Git Repo
rsync -av --delete ./backups/recruitment_agents/ $REPO_PATH/workflows/

# 4. Push to Git
cd $REPO_PATH
git add .
git commit -m "Update workflows"
git push origin main
