import subprocess
import ast

# get the current display configuration command
output = subprocess.check_output(["/opt/homebrew/bin/displayplacer", "list"])
lines = output.decode().strip().split("\n")
last_line = lines[-1]
params = last_line.replace("displayplacer ", "").replace("\"", "").split(" ")

# Ensure the list is only 14 items long (2 displays), if not exit
if len(params) == 14:
    # Get each displays parameters
    display1_params = params[:7]
    display2_params = params[7:]

    # invert the extended display's origin
    new_ext_origin = ast.literal_eval(display2_params[5][7:])
    new_ext_origin = tuple(-x for x in new_ext_origin)

    # replace the origin with the new one
    display2_params[5] = display2_params[5][:7] + str(new_ext_origin).replace(" ", "")

    # swap the origins of display 1 and 2
    display1_params[5], display2_params[5] = display2_params[5], display1_params[5]

    # convert each list back to a string and join them with spaces
    display1: str = " ".join(display1_params)
    display2: str = " ".join(display2_params)

    # Build the command to swap the displays
    command = '/opt/homebrew/bin/displayplacer "{}" "{}"'.format(display2, display1)

    # execute the command
    result = subprocess.run(command, shell=True, stdout=subprocess.PIPE)
    if result.returncode != 0:
        print("Error: Could not swap displays, " + result.stdout.decode())
else:
    print("Error: Must have 2 displays, cannot be mirrored")
