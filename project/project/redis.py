import os

import redis

from project.conf.redis_config import REDIS_PORT, BROKER_HOST

redis_instance = redis.StrictRedis(host=BROKER_HOST,
                                   port=REDIS_PORT, db=0)
