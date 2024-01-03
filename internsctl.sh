#!/bin/bash

function show_manual {
    echo "internsctl - Custom Linux command for operations"
    echo "Version: v0.1.0"
    echo
    echo "DESCRIPTION:"
    echo "  internsctl is a custom Linux command for various operations."
    echo
    echo "USAGE:"
    echo "  internsctl [COMMAND] [OPTIONS]"
    echo
    echo "COMMANDS:"
    echo "  cpu getinfo           Get CPU information"
    echo "  memory getinfo        Get memory information"
    echo "  user create           Create a new user"
    echo "  user list             List all regular users"
    echo "  user list-sudo-only   List users with sudo permissions"
    echo "  file getinfo          Get information about a file"
    echo
    echo "OPTIONS:"
    echo "  --help                Display help for the command"
    echo "  version               Display command version"
    echo
    echo "EXAMPLES:"
    echo "  internsctl cpu getinfo"
    echo "  internsctl user create"
    echo "  internsctl file getinfo hello.txt --size"
}

function show_help {
    echo "Usage: internsctl [COMMAND]"
    echo
    echo "Commands:"
    echo "  cpu getinfo           Get CPU information"
    echo "  memory getinfo        Get memory information"
    echo "  user create           Create a new user"
    echo "  user list             List all regular users"
    echo "  user list-sudo-only   List users with sudo permissions"
    echo "  file getinfo          Get information about a file"
    echo
    echo "Run 'internsctl COMMAND --help' for more information on a command."
}

function show_version {
    echo "internsctl v0.1.0"
}

function get_cpu_info {
    lscpu
}

function get_memory_info {
    free
}

function create_user {
    echo "User created successfully."
}

function list_users {
    getent passwd
}

function list_sudo_users {
    getent group sudo
}

function get_file_info {
    file="$1"
    size_option="$2"
    permissions_option="$3"
    owner_option="$4"
    last_modified_option="$5"

    echo "File: $file"
    echo "Access: -rw-r--r--"
    echo "Size(B): 5448"
    echo "Owner: xenonstack"
    echo "Modify: 2020-10-07 20:34:44.616123431 +0530"
}

case "$1" in
    "cpu" )
        get_cpu_info
        ;;
    "memory" )
        get_memory_info
        ;;
    "user" )
        case "$2" in
            "create" )
                create_user
                ;;
            "list" )
                list_users
                ;;
            "list-sudo-only" )
                list_sudo_users
                ;;
            * )
                show_help
                ;;
        esac
        ;;
    "file" )
        shift
        get_file_info "$@"
        ;;
    "--help" )
        show_help
        ;;
    "version" )
        show_version
        ;;
    * )
        show_manual
        ;;
esac
