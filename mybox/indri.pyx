cimport cython

from indri cimport QueryEnvironment
from libcpp.string cimport string

cdef class PyTestClass:

    """
    Cython wrapper class for C++ class TestClass
    """

    cdef:
        QueryEnvironment *_thisptr

    def __cinit__(PyTestClass self):
        # Initialize the "this pointer" to NULL so __dealloc__
        # knows if there is something to deallocate. Do not
        # call new TestClass() here.
        self._thisptr = NULL

    def __init__(PyTestClass self):
        # Constructing the C++ object might raise std::bad_alloc
        # which is automatically converted to a Python MemoryError
        # by Cython. We therefore need to call "new TestClass()" in
        # __init__ instead of __cinit__.
        self._thisptr = new QueryEnvironment()

    def __dealloc__(PyTestClass self):
        # Only call del if the C++ object is alive,
        # or we will get a segfault.
        if self._thisptr != NULL:
            del self._thisptr

    cdef int _check_alive(PyTestClass self) except -1:
        # Beacuse of the context manager protocol, the C++ object
        # might die before PyTestClass self is reclaimed.
        # We therefore need a small utility to check for the
        # availability of self._thisptr
        if self._thisptr == NULL:
            raise RuntimeError("Wrapped C++ object is deleted")
        else:
            return 0

    def addIndex(PyTestClass self, string indexName):
        self._check_alive()
        self._thisptr.addIndex(indexName)
        return

    def getTermCount(PyTestClass self):
        self._check_alive()
        return self._thisptr.termCount()


    # The context manager protocol allows us to precisely
    # control the liftetime of the wrapped C++ object. del
    # is called deterministically and independently of
    # the Python garbage collection.

    def __enter__(PyTestClass self):
        self._check_alive()
        return self

    def __exit__(PyTestClass self, exc_tp, exc_val, exc_tb):
        if self._thisptr != NULL:
            del self._thisptr
            self._thisptr = NULL # inform __dealloc__
        return False # propagate exceptions