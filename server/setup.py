from setuptools import (
    setup,
    find_packages,
)

setup(
    name='makemoney_server',
    packages=find_packages(),
    version='0.1',
    install_requires=[
        'falcon==0.3.0',
        'psycopg2==2.6.1',
        'SQLAlchemy==1.0.10',
    ],
)
