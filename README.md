# 🐚 Bash Scripts Collection

Collection of useful bash scripts for automation and system administration.

## 📋 Table of Contents

- [About](#about)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Adding Scripts to PATH](#adding-scripts-to-path)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## 📖 About

This repository contains a collection of bash scripts I've developed to facilitate various automation tasks, system administration, and common operations.

## ⚙️ Prerequisites

- Bash 4.0 or higher
- Operating System: Linux/Unix/macOS
- Appropriate execution rights for certain scripts

## 🚀 Installation

```bash
# Clone the repository
git clone https://github.com/menot404/bash-scripts.git
cd bash-scripts

# Make scripts executable
chmod +x **/*.sh
```

## 📁 Project Structure

```
bash-scripts/
├── automation/          # Automation scripts
├── system/             # System scripts
├── utils/              # Miscellaneous utilities
├── network/            # Network scripts
└── backup/             # Backup scripts
```

## 🔧 Adding Scripts to PATH

To execute your scripts from anywhere in the system, you have several options:

### Option 1: Dedicated Directory in /usr/local/bin

```bash
# Create symbolic links (recommended)
sudo ln -s $(pwd)/automation/backup.sh /usr/local/bin/backup
sudo ln -s $(pwd)/system/monitor.sh /usr/local/bin/monitor

# Or copy scripts directly
sudo cp automation/*.sh /usr/local/bin/
```

### Option 2: Personal ~/bin Directory

```bash
# Create directory if it doesn't exist
mkdir -p ~/bin

# Create symbolic links
ln -s $(pwd)/automation/backup.sh ~/bin/backup
ln -s $(pwd)/utils/converter.sh ~/bin/converter

# Add ~/bin to PATH in ~/.bashrc or ~/.zshrc
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Option 3: Dedicated Directory with /etc/profile.d/

```bash
# Create a dedicated directory for your scripts
sudo mkdir -p /opt/bash-scripts

# Copy or link your scripts
sudo cp -r * /opt/bash-scripts/

# Create a configuration file in /etc/profile.d/
sudo nano /etc/profile.d/bash-scripts.sh
```

Content of `/etc/profile.d/bash-scripts.sh` file:
```bash
#!/bin/bash
# Add custom scripts to PATH
export PATH="/opt/bash-scripts/automation:/opt/bash-scripts/system:/opt/bash-scripts/utils:$PATH"
```

```bash
# Make the file executable
sudo chmod +x /etc/profile.d/bash-scripts.sh

# Reload configuration (or logout/login)
source /etc/profile.d/bash-scripts.sh
```

### Option 4: Personal Dedicated Directory

```bash
# Create a directory in your home
mkdir -p ~/.local/scripts

# Clone or copy your scripts
cp -r * ~/.local/scripts/

# Add to PATH in ~/.bashrc
echo 'export PATH="$HOME/.local/scripts/automation:$HOME/.local/scripts/system:$HOME/.local/scripts/utils:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 💡 Usage

### Basic Example

```bash
# Make the script executable
chmod +x automation/backup.sh

# Execute the script
./automation/backup.sh
```

### With Arguments

```bash
./utils/converter.sh --input file.txt --output result.txt
```

## 🛠️ Configuration

Some scripts require configuration. Copy the example file and modify according to your needs:

```bash
cp config.example.sh config.sh
nano config.sh
```

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Fork the project
2. Create a branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

## 📝 Best Practices

- All scripts must start with `#!/bin/bash`
- Document important functions and variables
- Handle errors with appropriate exit codes
- Test scripts before committing

## ⚠️ Warning

Some scripts may require root privileges. Make sure you understand what a script does before executing it with sudo.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Me_Not404**

- GitHub: [Me_Not404](https://github.com/menot404)

## 🙏 Acknowledgments

- Thanks to the open source community
- Inspired by various projects and tutorials

---

⭐ Don't forget to star this project if you found it useful!
