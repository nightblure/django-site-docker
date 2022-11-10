import os

import redis

from project.conf.redis_config import REDIS_PORT, REDIS_HOST

redis_instance = redis.StrictRedis(host=REDIS_HOST,
                                   port=REDIS_PORT, db=0)
