
#include "index.hpp"

IndriIndex::IndriIndex() {
    env.addIndex("/Users/praveen/work/data/index/clueweb12_sample" );
    indri::server::LocalQueryServer local(r);
    cout << local.termCount() << endl;

}

long IndriIndex::getTermCount(){
    indri::server::LocalQueryServer local(r);
    return local.termCount();
}