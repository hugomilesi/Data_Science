from pickletools import long1
from setuptools import setup

with open('README.md', 'r') as fh:
    long_description = fh.read()

setup(
    name = 'pwd_generator',
    version = '0.0.3',
    authors = [{'name' : 'Hugo Milesi', 'email' : 'hugogmilesi@gmail.com'}],
    description = 'Simple password generator',
    py_modules = ['pwd_generator'],
    package_dir = {'': 'src'},   
    license = 'MIT',
    python_requires = '>= 3.6', 
    long_description_content_type="text/markdown",
    long_description=long_description,
)
