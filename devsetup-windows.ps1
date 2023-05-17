function Install-Choco {
    if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
        Write-Host "Chocolatey not found. Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
}

function Install-App {
    param (
        [string]$appName,
        [string]$chocoName = ""
    )

    if ($chocoName -eq "") {
        $chocoName = $appName
    }

    Write-Host "Installing $appName..."
    choco install $chocoName -y
}

function Check-App {
    param (
        [string]$appName
    )

    $app = Get-Command $appName -ErrorAction SilentlyContinue
    return ($app -ne $null)
}

# Install Chocolatey
Install-Choco

# Define tools and their Chocolatey package names
$tools = @{
    "Git" = "git";
    "Visual Studio Code" = "visualstudiocode";
    "Hyper" = "hyper";
    "Sublime Text" = "sublimetext3";
    "Atom" = "Atom";
    "Python" = "python";
    "Node.js" = "nodejs";
    "Yarn" = "yarn";
    "Ruby" = "ruby";
    "PHP" = "php";
    "Composer" = "composer";
    "Go" = "golang";
    "Rust" = "rust";
    "Docker" = "docker-desktop";
    "Postman" = "postman";
    "Java" = "jdk11";
    "Gradle" = "gradle";
    "Maven" = "maven";
    "MySQL" = "mysql";
    "PostgreSQL" = "postgresql";
    "SQLite" = "sqlite";
    "MongoDB" = "mongodb";
    "Redis" = "redis";
    "Elasticsearch" = "elasticsearch";
    "Cassandra" = "cassandra";
    "GitLab Runner" = "gitlab-runner";
    "GitHub Desktop" = "github-desktop";
    "Azure Data Studio" = "azure-data-studio";
    "Firebase CLI" = "firebase";
}

# Ask user which tools to install
Write-Host "Please select the themes you want to install:"
Write-Host "1. Code Editors"
Write-Host "2. Programming Languages"
Write-Host "3. Databases"
Write-Host "4. Version Control"
Write-Host "5. Cloud and DevOps"
Write-Host "6. Custom (Choose specific tools)"
Write-Host "Enter the numbers (comma-separated) for the themes you want to install: "
$selectedThemes = Read-Host

$toolsToInstall = @()

switch -Regex ($selectedThemes) {
    "1" { $toolsToInstall += "Visual Studio Code", "Hyper", "Sublime Text", "Atom" }
    "2" { $toolsToInstall += "Python", "Node.js", "Yarn", "Ruby", "PHP", "Composer", "Go", "Rust" }
    "3" { $toolsToInstall += "MySQL", "PostgreSQL", "SQLite", "MongoDB",
        "Redis", "Elasticsearch", "Cassandra" }
    "4" { $toolsToInstall += "Git", "GitHub Desktop" }
    "5" { $toolsToInstall += "Docker", "Postman", "Java", "Gradle", "Maven", "GitLab Runner", "Azure Data Studio", "Firebase CLI" }
    "6" {
        Write-Host "Enter the names of the tools you want to install (comma-separated): "
        $customTools = Read-Host
        $toolsToInstall = $customTools.Split(',')
    }
}

# Remove duplicates
$toolsToInstall = $toolsToInstall | Select -Unique

# Install selected tools
foreach ($tool in $toolsToInstall) {
    $tool = $tool.Trim()
    if (!$tools.ContainsKey($tool)) {
        Write-Host "Invalid tool name: $tool"
        continue
    }

    if (Check-App $tools[$tool]) {
        Write-Host "$tool is already installed. Skipping..."
    } else {
        Install-App $tool $tools[$tool]
    }
}

Write-Host "Installation complete!"
