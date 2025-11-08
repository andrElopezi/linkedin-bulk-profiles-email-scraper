""",
        },
        "requirements.txt": """
requests
beautifulsoup4
""",
    }
}

# Function to generate a formatted output for each file
def generate_file(path, content):
    print(f"### {path}")
    print("```python")
    print(content.strip())
    print("```")

# Recursive function to go through the directory structure
def generate_directory_code_structure(directory, base_path=""):
    for folder, files in directory.items():
        current_path = f"{base_path}{folder}"
        if isinstance(files, dict):
            generate_directory_code_structure(files, current_path + "/")
        else:
            generate_file(current_path, files)

# Start the generation process
generate_directory_code_structure(directory_structure)

Steps to run it:

Copy and paste the code into a .py file (e.g., generate_code.py).

Run it with Python on your local machine by using:
bashpython generate_code.py

This will output the source code for each file based on the directory structure. Let me know if you need any further assistance!