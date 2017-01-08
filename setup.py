# Upgraded from distutils (so old!) to setuptools to support install_requires=[]
# from distutils.core import setup
from setuptools import setup
import os

version_file = open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'VERSION'))
version = version_file.read().strip()

setup(
    name='nicwaller.yq',
    version=version,
    author='Nic Waller',
    author_email='code@nicwaller.com',
    description='A little wrapper for jq to read YAML files',
    install_requires=[
        'pyyaml'
    ],
    scripts=[
        'scripts/yq',
    ],
    data_files=[
        'VERSION',
    ]
)
