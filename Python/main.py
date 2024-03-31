import add_three
import math
import random


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

print(add_three.add_three(4))

building_id = 12
building_name = "URJC-Library"
lat = 40.337088
lon = -3.875840
# f-string format
building_info = f'Building {building_id :04}. Name: {building_name}. GPS: {lat :.4f}, {lon :.4f}.'
print(building_info)
# printf style string formatting
building_info = 'Building %04d. Name: %s. GPS: %.4f, %.4f.' % (building_id, building_name, lat, lon)
print(building_info)
# printf style string formatting
building_info = 'Building %(id)04d. Name: %(name)s. GPS: %(lat).4f, %(lon).4f.' %{"id": building_id, "name": building_name, "lat": lat, "lon": lon}
print(building_info)