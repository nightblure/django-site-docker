import redis
from redis import Redis

from project.conf.redis_config import REDIS_PORT, REDIS_HOST

redis_instance: Redis | None = None


def get_redis_instance() -> Redis:
    global redis_instance

    if not redis_instance:
        redis_instance = redis.StrictRedis(
            host=REDIS_HOST,
            port=REDIS_PORT,
            db=0
        )

    return redis_instance
