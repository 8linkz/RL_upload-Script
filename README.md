# ReversingLabs Bulk Upload Tool

A Python-based tool for automated bulk uploading of files to ReversingLabs A1000 platform for malware analysis. This tool provides a convenient way to submit multiple files for cloud analysis with proper rate limiting and error handling.

## Features

- **Automated Environment Setup**: Creates and manages Python virtual environment
- **Bulk File Upload**: Processes all files in a specified directory
- **Cloud Analysis**: Automatically initiates cloud analysis for uploaded samples
- **Rate Limiting**: Built-in delays to prevent API overload
- **Error Handling**: Continues processing even if individual files fail
- **Status Reporting**: Real-time feedback on upload progress

## Prerequisites

- Python 3.x installed on your system
- Access to a ReversingLabs A1000 instance
- Valid API token for authentication
- Bash shell (Linux/macOS) or compatible environment

## Installation & Setup

### 1. Download the Files

Place both `upload.sh` and `rl_upload.py` in your preferred directory.

### 2. Configure the Tool

You need to update **4 configuration points** before using the tool:

#### In `upload.sh`:
1. **DEFAULT_SCRIPT_PATH**: Replace `PATH-TO-THE-PYTHON-FILE` with the full path to your `rl_upload.py` file
   ```bash
   DEFAULT_SCRIPT_PATH="/path/to/your/rl_upload.py"
   ```

#### In `rl_upload.py`:
2. **YOUR-URL** and **YOUR-API-TOKEN**: Replace with your ReversingLabs A1000 instance URL (where you normally log in) and your valid API authentication token
   ```python
   a1000 = A1000(host="https://your-instance.reversinglabs.com", token="your_actual_api_token_here", verify=True)
   ```

4. **PATH OF THE FILES TO BE UPLOADED**: Replace with the directory containing files you want to analyze
   ```python
   folder_path = "/path/to/your/malware/samples"
   ```

### 3. Make the Script Executable (Optional)

```bash
chmod +x upload.sh
```

## Usage

### Basic Usage
```bash
./upload.sh
```
This will use the default Python script path configured in the file.

### Custom Script Path
```bash
./upload.sh /custom/path/to/rl_upload.py
```

### Help
```bash
./upload.sh --help
```

## How It Works

1. **Environment Check**: The bash script automatically creates a Python virtual environment if it doesn't exist
2. **SDK Installation**: Installs the ReversingLabs SDK from the official GitHub repository
3. **File Processing**: The Python script iterates through all files in the specified directory
4. **Upload & Analysis**: Each file is uploaded and submitted for cloud analysis
5. **Rate Limiting**: 1-2 second delays between uploads to respect API limits
6. **Status Updates**: Real-time feedback on upload success/failure

## API Documentation

- **Official API Documentation**: [ReversingLabs API Docs](https://docs.reversinglabs.com/SpectraAnalyze/API%20Documentation/submissions/)
- **Interactive API Explorer**: Use your instance's Swagger UI at `https://your-instance.reversinglabs.com/api/schema/swagger-ui/`
- **Python SDK**: [ReversingLabs Python SDK](https://github.com/reversinglabs/reversinglabs-sdk-py3)

## File Structure

```
your-project/
├── upload.sh          # Bash wrapper script
├── rl_upload.py        # Python upload script
└── samples/           # Directory with files to upload (example)
```

## Configuration Example

After configuration, your files should look like this:

**upload.sh**:
```bash
DEFAULT_SCRIPT_PATH="/home/user/reversinglabs/rl_upload.py"
```

**rl_upload.py**:
```python
a1000 = A1000(host="https://mycompany.reversinglabs.com", token="abcd1234efgh5678", verify=True)
folder_path = "/home/user/malware_samples"
```

## Troubleshooting

### Common Issues

- **Script not found**: Ensure the `DEFAULT_SCRIPT_PATH` points to the correct location of `rl_upload.py`
- **Authentication failed**: Verify your API token is valid and has upload permissions
- **Connection errors**: Check that your A1000 URL is correct and accessible
- **File not found**: Ensure the upload directory exists and contains files

### Virtual Environment

The tool automatically manages a virtual environment at `~/reversinglabs_env`. If you encounter issues:

```bash
# Remove the virtual environment to force recreation
rm -rf ~/reversinglabs_env
./upload.sh
```

## Security Notes

- Keep your API token secure and never commit it to version control
- Consider using environment variables for sensitive configuration
- Ensure uploaded files are from trusted sources
- Review ReversingLabs terms of service for file submission guidelines

## Support

For technical support and documentation:
- ReversingLabs Documentation: [docs.reversinglabs.com](https://docs.reversinglabs.com)
- SDK Issues: [GitHub Repository](https://github.com/reversinglabs/reversinglabs-sdk-py3)
- API Reference: Your instance's Swagger UI