# NFS Server and Client Setup Scripts Documentation

## Table of Contents

1. [Server Setup](#server-setup)
   - [Introduction](#server-introduction)
   - [Prerequisites](#server-prerequisites)
   - [Usage](#server-usage)
     - [Downloading the Server Setup Script](#server-downloading-the-script)
     - [Executing the Server Setup Script](#server-execution)
     - [User Prompts](#server-user-prompts)
   - [Server Script Details](#server-script-details)
     - [Script Purpose](#server-script-purpose)
     - [Script Actions](#server-script-actions)
   - [Security Considerations](#server-security-considerations)
   - [Troubleshooting](#server-troubleshooting)
   - [License](#server-license)
2. [Client Setup](#client-setup)
   - [Introduction](#client-introduction)
   - [Prerequisites](#client-prerequisites)
   - [Usage](#client-usage)
     - [Downloading the Client Setup Script](#client-downloading-the-script)
     - [Executing the Client Setup Script](#client-execution)
     - [User Prompts](#client-user-prompts)
   - [Client Script Details](#client-script-details)
     - [Script Purpose](#client-script-purpose)
     - [Script Actions](#client-script-actions)
   - [Security Considerations](#client-security-considerations)
   - [Troubleshooting](#client-troubleshooting)
   - [License](#client-license)

## 1. Server Setup <a name="server-setup"></a>

### Introduction <a name="server-introduction"></a>

This section provides comprehensive information about the NFS (Network File System) server setup script. The script automates the process of configuring an NFS server on a Linux-based host machine, allowing you to share directories with NFS clients.

### Prerequisites <a name="server-prerequisites"></a>

Before using the NFS server setup script, ensure you meet the following prerequisites:

- A Linux-based operating system.
- Superuser privileges (root or sudo) to execute the script.
- A directory where you want to create the NFS share (e.g., `/mnt/volume-nyc3-01/nfs`).

### Usage <a name="server-usage"></a>

#### Downloading the Server Setup Script <a name="server-downloading-the-script"></a>

1. Clone or download the server setup script to your local machine.

2. Open a terminal and navigate to the directory where the script is located.

#### Executing the Server Setup Script <a name="server-execution"></a>

Execute the server setup script by running the following command in the terminal:

```bash
./nfs-server-setup.sh
```

#### User Prompts <a name="server-user-prompts"></a>

During script execution, you will be prompted to provide the following information:

- **Client IP Address:** Enter the IP address of the NFS client that will access the NFS share.

The script will guide you through the setup process based on your input.

### Server Script Details <a name="server-script-details"></a>

#### Script Purpose <a name="server-script-purpose"></a>

The NFS server setup script automates the following tasks:

- Updates package lists and installs `nfs-kernel-server`, a package necessary for NFS server functionality.
- Creates a directory for the NFS share.
- Sets the ownership of the NFS share directory.
- Configures the NFS share in the `/etc/exports` file.
- Restarts the NFS server to apply the configuration.
- Configures the firewall (UFW) to allow NFS traffic from the specified client.

#### Script Actions <a name="server-script-actions"></a>

The script performs the following actions:

1. Updates package lists and installs `nfs-kernel-server`.
2. Creates the NFS export directory.
3. Sets the ownership of the NFS export directory.
4. Configures the NFS share in `/etc/exports`.
5. Restarts the NFS server.
6. Configures the firewall (UFW) to allow NFS traffic from the specified client.

### Security Considerations <a name="server-security-considerations"></a>

- This script does not enable encryption for NFS, which means data transmission is not secured. If security is a concern, consider using NFS over SSH or implementing other security measures.

- Be cautious when configuring firewall rules. Ensure that your firewall configuration aligns with your security policies and only allows necessary traffic.

### Troubleshooting <a name="server-troubleshooting"></a>

If you encounter issues while using the script, refer to the troubleshooting section in the README or seek assistance from your system administrator.

### License <a name="server-license"></a>

This script is provided as-is without any warranty. You may use and modify it for your own purposes, but use it responsibly and ensure that it aligns with your system's security requirements and policies.

## 2. Client Setup <a name="client-setup"></a>

### Introduction <a name="client-introduction"></a>

This section provides comprehensive information about the NFS client setup script. The script automates the process of configuring an NFS client on a Linux-based system, allowing it to access remote NFS shares.

### Prerequisites <a name="client-prerequisites"></a>

Before using the NFS client setup script, ensure you meet the following prerequisites:

- A Linux-based operating system.
- Superuser privileges (root or sudo) to execute the script.

### Usage <a name="client-usage"></a>

#### Downloading the Client Setup Script <a name="client-downloading-the-script"></a>

1. Clone or download the client setup script to your local machine.

2. Open a terminal and navigate to the directory where the script is located.

#### Executing the Client Setup Script <a name="client-execution"></a>

Execute the client setup script by running the following command in the terminal:

```bash
./nfs-client-setup.sh
```

#### User Prompts <a name="client-user-prompts"></a>

During script execution, you will be prompted to provide the following information:

- **Host IP Address:** Enter the IP address of the NFS server you want to connect to.

The script will guide you through the setup process based on your input.

### Client Script Details <a name="client-script-details"></a>

#### Script Purpose <a name="client-script-purpose"></a>

The NFS client setup script automates the following tasks:

- Updates package lists and installs `nfs-common`, a package necessary for NFS client functionality.
- Creates a directory to mount the NFS server's share.
- Mounts the NFS share from the specified server.
- Displays disk space and usage information for the mounted NFS share.
- Tests access to the NFS share by creating a test file.
- Adds an entry to `/etc/fstab` for automatic NFS share mounting at boot.

#### Script Actions <a name="client-script-actions"></a>

The script performs the following actions:

1. Updates package lists and installs `nfs-common`.
2. Creates the directory for NFS share mounting.
3. Mounts the NFS share from the specified server.
4. Displays disk space information using `df`.
5. Displays disk usage information using `du`.

1. **Tests Access**: The script tests access to the NFS share by creating a test file.

2. **Automatic Mounting**: It adds an entry to `/etc/fstab` to ensure that the NFS share is automatically mounted at boot, providing seamless access to the share.

### Security Considerations <a name="client-security-considerations"></a>

- This script does not use encryption for NFS. If data security and privacy are concerns, consider implementing NFS over SSH or other encryption methods.

- Ensure that the NFS server you are connecting to is configured securely and restricts access to authorized clients.

### Troubleshooting <a name="client-troubleshooting"></a>

If you encounter issues while using the script, refer to the troubleshooting section in the README or seek assistance from your system administrator.

### License <a name="client-license"></a>

This script is provided as-is without any warranty. You may use and modify it for your own purposes, but use it responsibly and ensure that it aligns with your system's security requirements and policies.

---
