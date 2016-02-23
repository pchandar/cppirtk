from libcpp.string cimport string
cdef extern from "indri/QueryEnvironment.hpp" namespace "indri::api":
    cdef cppclass QueryEnvironment:
        QueryEnvironment() #except +
        int termCount()
        void addIndex(string)
        #long getTermCount()