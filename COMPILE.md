# How to compile from sources, in a virtual environment

### In your virtual environment `site-packages` directory

```shell
cd ~/python37/lib/python3.7/site-packages/
ln -s /usr/lib/python3.7/site-packages/sip*.py ./
```
Alternatively, you can fetch `sipdistutils.py` and `sipconfig.py` from SIP sources.

### Clone my fork and build a wheel

```shell
git clone git@github.com:dargor/python-poppler-qt5.git
cd python-poppler-qt5/
git checkout ${latest_release_tag}
python setup.py bdist_wheel
cd dist/
pip install -U ./python_poppler_qt5-0.74.0-cp37-cp37m-linux_x86_64.whl
```

### Enjoy a well deserved victory drink.

*This was tested on my Gentoo with Python 3.7.
YMMV.*

# Usage in Python

If you get something like that :
```python
>>> import popplerqt5
Traceback (most recent call last):
  File "<input>", line 1, in <module>
    import popplerqt5
ImportError: /home/dargor/python36/lib/python3.6/site-packages/PyQt5/QtCore.so: symbol _ZN23QOperatingSystemVersion11MacOSMojaveE version Qt_5 not defined in file libQt5Core.so.5 with link time reference
>>> 
```

You may have to import `PyQt5.QtCore` before `popplerqt5` :
```python
>>> from PyQt5 import QtCore
>>> import popplerqt5
>>> popplerqt5.poppler_version()
(0, 62, 0)
>>> popplerqt5.version()
(0, 24, 2)
>>> 
```
