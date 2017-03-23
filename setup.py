from setuptools import find_packages, setup
from webhook import __version__


setup(
    name='webhook',
    version=__version__,
    url='http://github.com/finnerds/webhook',
    author='Finnerds',
    author_email='contact@finnerds.com',
    description="Brings webhook system to django. Django 1.8 and up only.",
    license='MIT',
    packages=find_packages(exclude=['main','tests']),
    include_package_data=True,
    install_requires=[
        'Django>=1.8',
    ],
    extras_require={
        'tests': [
            'coverage',
            'flake8>=2.0,<3.0',
            'isort',
        ]
    },
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Web Environment',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Topic :: Internet :: WWW/HTTP',
    ],
)
