# How to compile from sources, in a virtual environment

### In your virtual environment `site-packages` directory

```shell
cd ~/python36/lib/python3.6/site-packages/
ln -s /usr/lib/python3.6/site-packages/sip*.py ./
```
Alternatively, you can fetch `sipdistutils.py` and `sipconfig.py` from SIP sources.

### Clone my fork and build a wheel

```shell
git clone git@github.com:dargor/python-poppler-qt5.git
cd python-poppler-qt5/
python setup.py bdist_wheel
cd dist/
pip install -U ./python_poppler_qt5-0.24.2-cp36-cp36m-linux_x86_64.whl
```

### Enjoy a well deserved victory drink.

*This was tested on my Gentoo with Python 3.6.
YMMV.*
