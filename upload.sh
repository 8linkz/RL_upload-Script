#!/bin/bash

# Default path to the Python script
DEFAULT_SCRIPT_PATH="PATH-TO-THE-PYTHON-FILE"

# Path to virtual environment
VENV_PATH="$HOME/reversinglabs_env"

# Function to display usage information
usage() {
    echo "Usage: $0 [path_to_script]"
    echo "  If no path is provided, will use default path: $DEFAULT_SCRIPT_PATH"
    exit 1
}

# Function to check if virtual environment exists
check_venv() {
    if [ ! -d "$VENV_PATH" ]; then
        echo "Virtual environment not found at $VENV_PATH"
        echo "Creating new virtual environment..."
        python3 -m venv "$VENV_PATH"
        
        # Activate virtual environment and install requirements
        source "$VENV_PATH/bin/activate"
        pip install git+https://github.com/reversinglabs/reversinglabs-sdk-py3.git
        deactivate
    fi
}

# Function to run the script
run_script() {
    local script_path=$1
    
    # Check if the script exists
    if [ ! -f "$script_path" ]; then
        echo "Error: Script not found at $script_path"
        exit 1
    fi
    
    # Activate virtual environment and run script
    echo "Activating virtual environment..."
    source "$VENV_PATH/bin/activate"
    
    echo "Running script at $script_path..."
    python3 "$script_path"
    
    # Deactivate virtual environment
    deactivate
}

# Main script logic
main() {
    # Check for help flag
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        usage
    fi
    
    # Check and setup virtual environment
    check_venv
    
    # Use provided path or default
    SCRIPT_PATH=${1:-$DEFAULT_SCRIPT_PATH}
    
    # Run the script
    run_script "$SCRIPT_PATH"
}

# Execute main function
main "$@"
