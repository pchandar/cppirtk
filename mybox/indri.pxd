from libcpp.string cimport string
cdef extern from "indri/QueryEnvironment.hpp" namespace "indri::api":
    ctypedef long long INT64;
    cdef cppclass QueryEnvironment:
        QueryEnvironment()  #except +

        void setMemory(int)
        void setBaseline(string)
        void setSingleBackgroundModel(bool)
        void setMaxWildcardTerms(int)
        void addServer(string)
        void addIndex(string)
        void close()
        void removeServer(string)
        void removeIndex(string)
        INT64 termCount()
        INT64 documentCount()
        INT64 termCountUnique()
        INT64 termCount()
        INT64 termCount(string)
        INT64 stemCount(string)
        INT64 termFieldCount(string, string)
        INT64 stemFieldCount(string, string)
        INT64 documentCount()
        INT64 documentCount(string)
        INT64 documentStemCount(string)
        double expressionCount(string, string)
        double documentExpressionCount(string, string)
        bytes stemTerm(string)
        #void setScoringRules( const std::vector<std::string>& rules );
        #void setStopwords( const std::vector<std::string>& stopwords );


        #void addIndex( class IndexEnvironment& environment );

        #QueryResults runQuery(QueryRequest)
        #std::vector<indri::api::ScoredExtentResult> runQuery( const std::string& query, int resultsRequested, const std::string &queryType = "indri" );
        #std::vector<indri::api::ScoredExtentResult> runQuery( const std::string& query, const std::vector<lemur::api::DOCID_T>& documentSet, int resultsRequested, const std::string &queryType = "indri" );
        #QueryAnnotation* runAnnotatedQuery( const std::string& query, int resultsRequested, const std::string &queryType = "indri" );
        #QueryAnnotation* runAnnotatedQuery( const std::string& query, const std::vector<lemur::api::DOCID_T>& documentSet, int resultsRequested, const std::string &queryType = "indri" );

        #std::vector<indri::api::ParsedDocument*> documents( const std::vector<lemur::api::DOCID_T>& documentIDs );
        #std::vector<indri::api::ParsedDocument*> documents( const std::vector<indri::api::ScoredExtentResult>& results );
        #std::vector<std::string> documentMetadata( const std::vector<lemur::api::DOCID_T>& documentIDs, const std::string& attributeName );
        #std::vector<std::string> documentMetadata( const std::vector<indri::api::ScoredExtentResult>& documentIDs, const std::string& attributeName );
        #std::vector<std::string> pathNames( const std::vector<indri::api::ScoredExtentResult>& results );
        #std::vector<indri::api::ParsedDocument*> documentsFromMetadata( const std::string& attributeName, const std::vector<std::string>& attributeValues );
        #std::vector<lemur::api::DOCID_T> documentIDsFromMetadata( const std::string& attributeName, const std::vector<std::string>& attributeValue );
        #std::vector<ScoredExtentResult> expressionList(string, string)
        #std::vector<std::string> fieldList();
        #int documentLength(lemur::api::DOCID_T documentID);
        #std::vector<DocumentVector*> documentVectors( const std::vector<lemur::api::DOCID_T>& documentIDs );
        #const std::vector<indri::server::QueryServer*>& getServers()

        #void setFormulationParameters(Parameters &p);
