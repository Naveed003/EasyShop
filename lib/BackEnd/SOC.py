

def UpdateIP():
    from requests import get

    from firebase import firebase

    firebase = firebase.FirebaseApplication(
        "https://fir-9741b-default-rtdb.firebaseio.com/", None)

    """data = {
        "IP_ADDR": "92.98.140.20:5000",
        "name": "Naveed"
    }

    result = firebase.post("/fir-9741b-default-rtdb/IpAddress", data)"""

    result = firebase.get("/fir-9741b-default-rtdb/IpAddress", "")

    for i in result:
        keyword = i

    OLD_IP = result[i]["IP_ADDR"]
    CURRENT_IP = get('https://api.ipify.org').text
    print(CURRENT_IP)
    if CURRENT_IP == OLD_IP:
        pass
    else:
        firebase.put(
            "/fir-9741b-default-rtdb/IpAddress/{}".format(keyword), "IP_ADDR", CURRENT_IP)


UpdateIP()