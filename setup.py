from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
from Cython.Distutils import build_ext
import glob

indriList = glob.glob("mybox/*.pyx")
extensions = [
    Extension("mybox.indri",
              sources=indriList,
              include_dirs=["ir/api/include", "ir/indri/include", "ir/indri/lemur/include"],
              extra_link_args=['build/libir.dylib'],
              language='c++',
              extra_compile_args=['-DSTDC_HEADERS=1', '-DHAVE_SYS_TYPES_H=1', '-DHAVE_SYS_STAT_H=1',
                                  '-DHAVE_STDLIB_H=1', '-DHAVE_STRING_H=1', '-DHAVE_MEMORY_H=1', '-DHAVE_STRINGS_H=1',
                                  '-DHAVE_INTTYPES_H=1', '-DHAVE_STDINT_H=1', '-DHAVE_UNISTD_H=1', '-DHAVE_FSEEKO=1',
                                  '-DHAVE_EXT_ATOMICITY_H=1', '-DP_NEEDS_GNU_CXX_NAMESPACE=1', '-DHAVE_MKSTEMP=1',
                                  '-DHAVE_MKSTEMPS=1', '-stdlib=libstdc++', '-g', '-O3']),

    # library_dirs = [...]),
]
setup(
    name="mybox",
    ext_modules=cythonize(extensions),
    #install_requires=['cython'],
    packages=['mybox'],
    #zip_safe=False,
    version="0.1",
    description='',
    author='',
    author_email='',
    url='',
    license='',
    cmdclass={"build_ext": build_ext},

)
