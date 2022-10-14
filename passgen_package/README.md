# pwd_generator

## Description. 
The package pwd_generator is used to:
	- Create passwords. 
	- Can be created with special characters or not.
	- Can be created with upper characters or not.
## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install package_name

```bash
pip install PwdGen2022
```

## Usage

```python
from pwd_gen import password
password.createPwd(pass_lenght, include_special, include_upper)
```
## Where:
- **pass_lenght**: Sets the size of your password.
- **include_special(default = False)**: Set to True if you want pecial characters(#,@...)
- **include_Upper(default  = False)**: Set to True if you wante uppercase latters.

## Author
Hugo Milesi

## License
[MIT](https://choosealicense.com/licenses/mit/)