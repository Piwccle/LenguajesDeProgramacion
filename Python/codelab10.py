import time


class Timer:
    def __init__(self, func):
        self.func = func
        self.initTime = 0
        self.endTime = 0

    def __call__(self, *args):
        self.initTime = time.time()
        return_value = self.func(*args)
        self.endTime = time.time()
        total_time = self.endTime - self.initTime
        print(f"{total_time:.4f} seconds elapsed")
        return return_value


@Timer
def main():
    index = 0
    while index < 10000000:
        index += 1


if __name__ == '__main__':
    main()
