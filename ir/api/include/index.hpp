//
//

#ifndef IR_INDEX_H
#define IR_INDEX_H
#include "indri/QueryEnvironment.hpp"
#include <indri/LocalQueryServer.hpp>
#include "indri/Repository.hpp"
class IndriIndex {
public:
    indri::api::QueryEnvironment env;
    indri::collection::Repository r;

public:
    IndriIndex();
    long getTermCount();

};

#endif //IR_INDEX_H
