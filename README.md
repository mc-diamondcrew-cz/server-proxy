# DCMC Open-Source Project
## server-proxy
This repository contains full proxy ([Velocity](https://velocitypowered.com/)) server of the DiamondCrew Minecraft Project.

## Links
- DCMC Website - https://mc.diamondcrew.cz
- DCMC Discord - https://mc.diamondcrew.cz/discord

# Sponsor
[Xephia.eu - High Quality Server Hosting](https://xephia.eu)

![Xephia Logo](https://xephia.eu/image/logo_black_cropped.png)

## Contribution
Contributing to the project is highly welcomed!

## Local Setup
### Cloning the repository
First step is to simply clone the repository to your desired location.
```shell
git clone https://github.com/mc-diamondcrew-cz/server-proxy
cd server-proxy
```

### Setting up the variables
After successfully cloning the repository, you will want to configure the required variables.

These variables are used for sensitive data, such as passwords, or unique thing per-server like ports etc..

**First, copy the variables.**
```shell
cp variables.txt.EXAMPLE variables.txt
```

**Then open `variables.txt` and fill out the required array fields.**
```shell
vim variables.txt
```

**File contents should look something like this:**
```shell
(
    ["SOME_PORT"]="12345"
    ["SOME_PASSWORD"]="superSecret123"
    ["SOME_IP"]="my.domain.tld:12345"
    ...
)
```

**!** All fields need to be **unique** and **CAN'T** contain special characters!

Now you can save the file and go to the next step.

## Configurations for ease of use.
Using for example IntelliJ's IDEA built-in configurations system, you can work with the whole project a lot faster.

### Recommended configurations
| Name | Path | Options          | Working Directory | Description |
| ---  | ---  |------------------|        ---        |     ---     |
| Start-ALL | `$PROJECT_DIR$/start.sh` | 4096 true true   | `$PROJECT_DIR$` | Downloads new language files, latest server version and starts the server with 4GBs of RAM. |
| Start-JAR | `$PROJECT_DIR$/start.sh` | 4096 true false  | `$PROJECT_DIR$` | Downloads latest server version and starts the server with 4GBs of RAM. |
| Start-LANG | `$PROJECT_DIR$/start.sh` | 4096 false true  | `$PROJECT_DIR$` | Downloads new language files and starts the server with 4GBs of RAM. |
| Start | `$PROJECT_DIR$/start.sh` | 4096 false false | `$PROJECT_DIR$` | Starts the server with 4GBs of RAM. |
| Variables-START | `$PROJECT_DIR$/variables.sh` | start | `$PROJECT_DIR$` | Replaces the variables with their configured values. |
| Variables-STOP | `$PROJECT_DIR$/variables.sh` | stop | `$PROJECT_DIR$` | Replaces variable's values with their variable names. |
| Language | `$PROJECT_DIR$/language.sh` | None | `$PROJECT_DIR$` | Downloads new language files. |

# Working with variables

Very important thing about the versioning system are the secret variables such as passwords to MySQL Databases.
That's why we use the `variables.sh` file.

**IT'S IMPORTANT** to make sure, that before committing, you run the `Variables-STOP` configuration, so we don't leak unwanted information to the repository.
If you have any other, better approach to dealing with such variables an Issue or a Pull Request will be highly welcomed!

## Variables format
As explained above, variables are stored in an array.

`["NAME"]="Value"` Could be used as `{$NAME}` variable in any configuration file.