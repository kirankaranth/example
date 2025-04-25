from setuptools import setup, find_packages
setup(
    name = 'p11',
    version = '1.0',
    packages = find_packages(include = ('p11*', )) + ['prophecy_config_instances.p11'],
    package_dir = {'prophecy_config_instances.p11' : 'configs/resources/p11'},
    package_data = {'prophecy_config_instances.p11' : ['*.json', '*.py', '*.conf']},
    description = 'workflow',
    install_requires = [
'prophecy-libs==1.9.46'],
    entry_points = {
'console_scripts' : [
'main = p11.pipeline:main'], },
    data_files = [(".prophecy", [".prophecy/workflow.latest.json"])],
    extras_require = {
'test' : ['pytest', 'pytest-html'], }
)
