import requests


def main():
    GITLAB_API_URL = 'https://gitlab.com/api/v4/'
    username = "jabiertxof"
    orderby = "last_activity_at"

    request = GITLAB_API_URL + 'users/' + username + "/projects/?order_by=" + orderby

    response = requests.get(request)
    print("\n".join(map(str, response.json())))


if __name__ == "__main__":
    main()
