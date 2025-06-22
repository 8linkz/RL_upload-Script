#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import time
from ReversingLabs.SDK.a1000 import A1000

def main():
    # Initialize the A1000 instance with the required parameters
    a1000 = A1000(host="YOUR-URL", token="YOUR-API-TOKEN", verify=True)
    
    # Path to the folder containing the files to be uploaded
    folder_path = "PATH OF THE FILES TO BE UPLOADED"
    
    # Check if the specified folder exists
    if not os.path.isdir(folder_path):
        print(f"The specified folder does not exist: {folder_path}")
        return
    
    # Iterate over all files in the specified folder
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        
        # Check if it is a file
        if os.path.isfile(file_path):
            try:
                # Open the file in binary mode
                with open(file_path, "rb") as file_handle:
                    # Upload the file and start a cloud analysis
                    response = a1000.upload_sample_from_file(file_source=file_handle, cloud_analysis=True)
                    time.sleep(2)
                    # Print the status of the upload
                    print(f"File {filename} uploaded. Status Code: {response.status_code}")
                    
                    # Process the response if necessary. The details of the response are available in JSON format under response.json().
                    # Example:
                    # response_data = response.json()
                    # print(response_data)
                    
            except Exception as e:
                # Print an error message if an error occurs during the upload
                print(f"Error uploading {filename}: {e}")
        
        # Sleep for 1 Seconds
        time.sleep(1)  # 1-second delay between uploads

if __name__ == "__main__":
    main()
