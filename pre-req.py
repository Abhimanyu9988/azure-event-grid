import subprocess
import time

# ANSI escape codes for text formatting and color
class Color:
    GREEN = "\033[92m"
    RED = "\033[91m"
    RESET = "\033[0m"

def check_event_grid_registration():
    # Run the command to check Event Grid registration state
    cmd = "az provider show --namespace Microsoft.EventGrid --query registrationState"
    result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    # Check if the registration state is not "Registered"
    if result.returncode == 0 and result.stdout.strip() != '"Registered"':
        return True
    else:
        return False

def main():
    print(f"{Color.GREEN}Hello, Hope you are having a nice day.{Color.RESET}")
    print(f"{Color.GREEN}Thank you for checking out Abhimanyu's documents. You are in the right hands!.{Color.RESET}")
    print("We will be deploying pre-requisites for creating an Azure Event Grid.")

    # Check Event Grid registration state
    if check_event_grid_registration():
        print(f"{Color.GREEN}Waiting for Microsoft.EventGrid registration to complete...{Color.RESET}")
        # You can add a loop or a sleep here to wait for registration to complete
        # For example, you can use a while loop to periodically check the registration state
        # and break the loop when it becomes "Registered."

    print("All done.. Goodbye and Good luck with your course!")

if __name__ == "__main__":
    main()
