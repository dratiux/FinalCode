from config import SECRET_KEY


def unused_helper():
    return 42


def get_user(user_id):
    try:
        return {"id": user_id, "token": SECRET_KEY}
    except Exception:
        return None
