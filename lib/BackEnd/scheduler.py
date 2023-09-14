from multiprocessing.context import Process
from SOC import UpdateIP
import schedule
from threading import Thread
import time
from CheckPrice import CheckPrice
from API import api
import multiprocessing

schedule.every().day.at("00:00").do(UpdateIP)
schedule.every().hour.do(CheckPrice)


if __name__ == "__main__":
    procss = multiprocessing.Process(target=api)
    procss.start()
    while True:
        schedule.run_pending()
        time.sleep(1)
