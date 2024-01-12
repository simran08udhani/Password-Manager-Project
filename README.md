# Password Manager Project

## Overview

This Python script provides a basic password manager functionality with encryption and secure storage using the AES encryption algorithm. The project utilizes the Crypto library for cryptographic operations and interacts with a MySQL database to store encrypted passwords and related information.

## Requirements

- Python 3.x
- MySQL database

### Required Python libraries:

- Crypto
- mysql-connector
- secrets
- string
- getpass
- zlib

## Installation

Install the required Python libraries using the following command:

```bash
pip install pycryptodome mysql-connector-python
```
### MySQL Database Setup:

1. Create a MySQL database named "passwordmanager."
2. Set up two tables: **`iv_n_key`** and **`psswrd_manager`**. The SQL schema is provided in the **`database_schema.sql`** file.
### Configure Database Connection:
Open the Jupyter Notebook (Password-Manager-Project.ipynb) and update the database connection details (host, user, password) in the **`mysql.connector.connect`** calls within the functions (**`fetch_key`**, **`save_to_database`**, **`get_password_from_database`**, **`update_password`**, **`delete_password`**).

## Usage
Run the Jupyter Notebook (Password-Manager-Project.ipynb) in your Python environment:
```bash
Password-Manager-Project.ipynb
```

The notebook provides a command-line interface with options:

- Enter 1 to save a new password
- Enter 2 to generate a password
- Enter 3 to show saved passwords
- Enter 4 to update a password
- Enter 5 to delete a password
- Enter 0 to exit
  
Follow prompts to perform actions.



## Functions
1. **generate_password():** Generates a random password with a mix of lowercase letters, uppercase letters, digits, and special characters. The password length is randomly chosen between 8 and 14 characters.

2. **save_to_database(website, username, password):** Encrypts the password and stores it in the MySQL database along with the website and username. If the user's key is not already stored in the database, it generates a new key.

3. **get_password_from_database(website, username):** Retrieves and decrypts the password from the database based on the specified website and username.

4. **update_password(website, username, new_password):** Updates the password for a specific website and username in the database.

5. **delete_password(website, username):** Deletes the password entry for a specific website and username from the database.

6. **user_interface():** Provides a simple command-line interface for the user to interact with the password manager. Allows the user to perform actions such as saving, generating, displaying, updating, and deleting passwords.

## Security Considerations
- Passwords are encrypted using the AES encryption algorithm with CBC mode and PKCS7 padding.
- Key derivation is performed using PBKDF2 with a random salt.
- The script uses a MySQL database to store encrypted passwords and related information.
  
**Note:** Ensure that you have secured your MySQL database appropriately, including proper authentication and access controls.

## Disclaimer
This password manager is intended for educational purposes and may not provide the same level of security as professionally developed and audited password managers. Use it at your own risk.

## License
The Password Manager Project is licensed under the [MIT License](LICENSE).

