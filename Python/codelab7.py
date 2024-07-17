import argparse
import datetime

todayDay = datetime.date.today()
daysago = datetime.date(todayDay.year, todayDay.month - 1, todayDay.day)

last30Days = []

with open("./ficheros/META.csv") as file:
    firstline = file.readline()
    for line in file:
        line = line.replace("\n", "").split(",")
        if datetime.datetime.strptime(line[0], '%Y-%m-%d').date() > daysago:
            last30Days.append(line)
print(last30Days)

parser = argparse.ArgumentParser()


def valid_date(s: str) -> datetime.datetime:
    try:
        return datetime.datetime.strptime(s, "%Y-%m-%d")
    except ValueError:
        raise argparse.ArgumentTypeError(f"not a valid date: {s!r}")


parser.add_argument(
    "-s",
    "--startdate",
    help="The Start Date - format YYYY-MM-DD",
    required=True,
    type=valid_date
)

parser.add_argument(
    "-f",
    "--enddate",
    help="The End Date - format YYYY-MM-DD",
    required=False,
    type=valid_date
)
args = parser.parse_args()

if args.enddate is None:
    args.enddate = datetime.date.today()

lastnDays = []

with open("./ficheros/META.csv") as file:
    firstline = file.readline()
    for line in file:
        line = line.replace("\n", "").split(",")
        day = datetime.datetime.strptime(line[0], '%Y-%m-%d').date()
        if day <= datetime.date(args.enddate.year, args.enddate.month, args.enddate.day):
            if day > datetime.date(args.startdate.year, args.startdate.month, args.startdate.day):
                lastnDays.append(line)
print(lastnDays)
