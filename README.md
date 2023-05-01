# 🚀 Developer Setup Script for Windows

This repository provides an easy-to-use and efficient PowerShell script that helps developers quickly set up their Windows development environment with various tools and utilities. The script is designed to be user-friendly, with prompts for selecting themes and checks for already installed software.

## 📚 Table of Contents

- [Introduction](#-introduction)
- [Installation](#-installation)
- [Usage](#-usage)
- [Themes and Tools](#-themes-and-tools)
- [Customization](#-customization)
- [About Chocolatey](#-about-chocolatey)
- [Contributing](#-contributing)

## 🎯 Introduction

Setting up a new development environment can be time-consuming and cumbersome. This script aims to simplify the process by automating the installation of common development tools using Chocolatey, a package manager for Windows.

## 📥 Installation

1. Clone this repository or download the script `devsetup-windows.ps1` from the repository.
2. Open PowerShell with administrative privileges (Right-click on PowerShell in the Start menu and select "Run as administrator").
3. Navigate to the folder where you downloaded or cloned the script.
4. Execute the script by running `.\devsetup-windows.ps1`.

## 🎮 Usage

When running the script, you will be prompted to choose from a set of predefined themes or select specific tools you want to install. The script checks if the tools are already installed, and if not, installs them using Chocolatey.

## 🧰 Themes and Tools

The script offers several themes to choose from, each containing a set of tools:

1. Code Editors
2. Programming Languages
3. Databases
4. Version Control
5. Cloud and DevOps

You can also choose to install specific tools from the available list.

## 🛠 Customization

If you'd like to add or remove tools from the script, you can edit the `$tools` hashtable variable in the script to include the desired tools and their corresponding Chocolatey package names.

## 🍫 About Chocolatey

Chocolatey is a package manager for Windows that makes it easy to install and manage software. It works similarly to package managers like `apt` and `yum` on Linux systems. Chocolatey leverages the NuGet infrastructure to provide a simple command-line interface for installing, upgrading, and managing software packages.

To learn more about Chocolatey, visit the [official website](https://chocolatey.org/).

## 💡 Contributing

We appreciate any contributions to improve this script. Feel free to open issues or submit pull requests if you find ways to make the script more efficient or user-friendly.

Happy coding! 🎉
