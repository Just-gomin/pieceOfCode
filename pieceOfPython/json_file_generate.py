import json

intVal = 10

student_data = {"key": intVal}

with open("sample.json", "w") as json_file:
     json.dump(student_data, json_file)
