 This readme file includes documentation for both the NFS Server Setup Revert Script and the NFS Client Setup Revert Script:

# NFS Setup Revert Scripts

This repository contains two Bash scripts designed to revert NFS server and client setup changes, respectively. These scripts also include instructions for usage and relevant explanations.

## Table of Contents

- [NFS Server Revert Script](#nfs-server-revert-script)
  - [Prerequisites](#prerequisites-for-nfs-server-revert-script)
  - [Usage](#usage-for-nfs-server-revert-script)
  - [Script Explanation](#script-explanation-for-nfs-server-revert-script)
  - [Caution](#caution-for-nfs-server-revert-script)
- [NFS Client Revert Script](#nfs-client-revert-script)
  - [Prerequisites](#prerequisites-for-nfs-client-revert-script)
  - [Usage](#usage-for-nfs-client-revert-script)
  - [Script Explanation](#script-explanation-for-nfs-client-revert-script)
  - [Caution](#caution-for-nfs-client-revert-script)
- [License](#license)

---

## NFS Server Revert Script

### Prerequisites for NFS Server Revert Script

Before using this script, ensure you have the following prerequisites:

- A Linux system with `sudo` access.
- NFS server and `nfs-kernel-server` package installed.
- Optionally, the UFW (Uncomplicated Firewall) enabled if you want to check and disable rules.

### Usage for NFS Server Revert Script

1. Clone or download this script to your server.

2. Make the script executable:
   ```bash
   chmod +x revert-nfs-server-setup.sh
   ```
   
3. Run the script:
   ```bash
   ./revert-nfs-server-setup.sh
   ```

4. Follow the on-screen prompts:
   - You will be asked to enter the `client_ip` used in the initial setup. This IP will be removed from the NFS configuration.

5. The script will:
   - Stop the NFS server.
   - Remove the NFS share configuration.
   - Reload the NFS configuration.
   - Remove the NFS shared directory.
   - Uninstall the `nfs-kernel-server` package and its dependencies.
   - If UFW is enabled, it will check and delete any rules allowing access from the specified client IP and disable UFW.

### Script Explanation for NFS Server Revert Script

- **Stop the NFS server:** This command stops the NFS server service.

- **Remove the NFS share configuration:** The script prompts you to enter the `client_ip`, and then it uses `sed` to remove the corresponding line containing the client IP from the `/etc/exports` file.

- **Reload the NFS configuration:** This command reloads the NFS configuration to apply the changes made.

- **Remove the created directory:** This command removes the directory that was shared via NFS.

- **Uninstall `nfs-kernel-server`:** These commands uninstall the NFS server package and remove any unnecessary dependencies.

- **Check and disable UFW rules (only if UFW was previously enabled):** These commands check the UFW status, delete any rules allowing access from the specified client IP to the NFS port, and then disable UFW if it was enabled.

### Caution for NFS Server Revert Script

- **Data Loss:** Be cautious when using this script, especially the part that removes directories, as it can lead to data loss if not used carefully. Ensure you have appropriate backups before running the script.

- **Client IP:** Make sure that the `client_ip` you provide matches the one you want to revoke access for.

---

## NFS Client Revert Script

### Prerequisites for NFS Client Revert Script

Before using this script, ensure you have the following prerequisites:

- A Linux system with `sudo` access.
- NFS client utilities installed.
- A previously configured NFS client setup that you want to revert.

### Usage for NFS Client Revert Script

1. Clone or download this script to your client machine.

2. Make the script executable:
   ```bash
   chmod +x revert-nfs-client-setup.sh
   ```

3. Run the script:
   ```bash
   ./revert-nfs-client-setup.sh
   ```

4. Follow the on-screen prompts:
   - You will be asked to enter the `host_ip` used in the initial setup. This IP will be used to remove the NFS share entry from `/etc/fstab`.

5. The script will:
   - Unmount the NFS share at `/nfs/general`.
   - Remove the NFS shared directory.
   - Remove the NFS share entry from `/etc/fstab`.
   - Uninstall the `nfs-common` package.

### Script Explanation for NFS Client Revert Script

- **Unmount the NFS share:** This command unmounts the NFS share located at `/nfs/general`.

- **Remove the created directory:** This command removes the directory that was mounted as an NFS share.

- **Remove the entry from `/etc/fstab`:** The script prompts you to enter the `host_ip`, and then it uses `sed` to remove the corresponding line containing the NFS share entry from `/etc/fstab`.

- **Uninstall packages:** The script uninstalls the `nfs-common` package, which is commonly used for NFS client configurations.

### Caution for NFS Client Revert Script

- **Data Loss:** Be cautious when using this script, especially the part that removes directories, as it can lead to data loss if not used carefully. Ensure you have appropriate backups before running the script.

- **Host IP:** Make sure that the `host_ip` you provide matches the one used in the NFS client setup that you want to revert.

---
```

This merged documentation provides a comprehensive overview of both the NFS Server Setup Revert Script and the NFS Client Setup Revert Script, making it easier for users to understand and use the scripts.
