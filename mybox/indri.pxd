from libcpp.string cimport string
cdef extern from "indri/QueryEnvironment.hpp" namespace "indri::api":
    cimport "inttypes.h"
    ctypedef int64_t           INT64;
    cdef cppclass QueryEnvironment:
        QueryEnvironment() #except +
        int termCount()
        int documentCount()

        void setMemory(int)
        void setBaseline(string)
        void setSingleBackgroundModel(bool)
        #void setScoringRules( const std::vector<std::string>& rules );
        #void setStopwords( const std::vector<std::string>& stopwords );

        void addServer(string)
        void addIndex(string)
        #void addIndex( class IndexEnvironment& environment );
        void close()
        void removeServer(string)
        void removeIndex(string)
        QueryResults runQuery(QueryRequest)
        #std::vector<indri::api::ScoredExtentResult> runQuery( const std::string& query, int resultsRequested, const std::string &queryType = "indri" );
        #std::vector<indri::api::ScoredExtentResult> runQuery( const std::string& query, const std::vector<lemur::api::DOCID_T>& documentSet, int resultsRequested, const std::string &queryType = "indri" );
        #QueryAnnotation* runAnnotatedQuery( const std::string& query, int resultsRequested, const std::string &queryType = "indri" );
        #QueryAnnotation* runAnnotatedQuery( const std::string& query, const std::vector<lemur::api::DOCID_T>& documentSet, int resultsRequested, const std::string &queryType = "indri" );


        #std::vector<indri::api::ParsedDocument*> documents( const std::vector<lemur::api::DOCID_T>& documentIDs );
        #std::vector<indri::api::ParsedDocument*> documents( const std::vector<indri::api::ScoredExtentResult>& results );


        #std::vector<std::string> documentMetadata( const std::vector<lemur::api::DOCID_T>& documentIDs, const std::string& attributeName );
        #std::vector<std::string> documentMetadata( const std::vector<indri::api::ScoredExtentResult>& documentIDs, const std::string& attributeName );

      /// \brief Fetch the XPath names of extents for a list of ScoredExtentResults
      /// @param results the list of ScoredExtentResults
      /// @return the vector of string XPath names for the extents
      std::vector<std::string> pathNames( const std::vector<indri::api::ScoredExtentResult>& results );


      /// \brief Fetch all documents with a metadata key that matches attributeName, with a value matching one of the attributeValues.
      /// @param attributeName the name of the metadata attribute (e.g. 'url' or 'docno')
      /// @param attributeValues values that the metadata attribute should match
      /// @return a vector of ParsedDocuments that match the given metadata criteria
      std::vector<indri::api::ParsedDocument*> documentsFromMetadata( const std::string& attributeName, const std::vector<std::string>& attributeValues );

      /// \brief Return a list of document IDs where the document has a metadata key that matches attributeName, with a value matching one of the attributeValues.
      /// @param attributeName the name of the metadata attribute (e.g. 'url' or 'docno')
      /// @param attributeValue values that the metadata attribute should match
      /// @return a vector of ParsedDocuments that match the given metadata criteria
      std::vector<lemur::api::DOCID_T> documentIDsFromMetadata( const std::string& attributeName, const std::vector<std::string>& attributeValue );
      /// \brief Return the stem of the term
      /// @param term the term to stem
      /// @return the stem of the term
      std::string stemTerm(const std::string &term);
      /// \brief Return total number of unique terms.
      /// @return total number of unique terms in the aggregated collection
      INT64 termCountUnique();
      /// \brief Return total number of terms.
      /// @return total number of terms in the aggregated collection
      INT64 termCount();
      /// \brief Return total number of term occurrences.
      /// @param term the term to count
      /// @return total frequency of this term in the aggregated collection
      INT64 termCount( const std::string& term );
      /// \brief Return total number of stem occurrences.
      /// @param term the stem to count
      /// @return total frequency of this stem in the aggregated collection
      INT64 stemCount( const std::string& term );
      /// \brief Return total number of term occurrences within a field.
      /// @param term the term to count
      /// @param field the name of the field
      /// @return total frequency of this term within this field in the
      /// aggregated collection
      INT64 termFieldCount( const std::string& term, const std::string& field );
      /// \brief Return total number of stem occurrences within a field.
      /// @param term the stem to count
      /// @param field the name of the field
      /// @return total frequency of this stem within this field in the
      /// aggregated collection
      INT64 stemFieldCount( const std::string& term, const std::string& field );
      /// \brief Return the total number of times this expression appears in the collection.
      /// @param expression The expression to evaluate, probably an ordered or unordered window expression
      double expressionCount( const std::string& expression,
                              const std::string &queryType = "indri" );
      /// \brief Return the total number of documents this expression appears in the collection.
      /// @param expression The expression to evaluate, probably an ordered or unordered window expression
      double documentExpressionCount( const std::string& expression,
                              const std::string &queryType = "indri" );
      /// \brief Return all the occurrences of this expression in the collection.
      /// Note that the returned vector may be quite large for large collections, and therefore
      /// has the very real possibility of exhausting the memory of the machine.  Use this method
      /// with discretion.
      /// @param expression The expression to evaluate, probably an ordered or unordered window expression
      std::vector<ScoredExtentResult> expressionList( const std::string& expression,
                                                      const std::string& queryType = "indri" );
      /// \brief Return the list of fields.
      /// @return vector of field names.
      std::vector<std::string> fieldList();
      /// \brief Return total number of documents in the collection.
      /// @return total number of documents in the aggregated collection
      INT64 documentCount();
      /// \brief Return total number of documents containing term in the collection.
      /// @param term the term to count documents for.
      /// @return total number of documents containing term in the aggregated collection
      INT64 documentCount( const std::string& term );

      /// \brief Return total number of documents containing stem in the collection.
      /// @param stem the prestemmed term to count documents for.
      /// @return total number of documents containing stem in the aggregated collection
      INT64 documentStemCount( const std::string& stem );


      #int documentLength(lemur::api::DOCID_T documentID);


      #std::vector<DocumentVector*> documentVectors( const std::vector<lemur::api::DOCID_T>& documentIDs );


      void setMaxWildcardTerms(int maxTerms)


      #const std::vector<indri::server::QueryServer*>& getServers()

      /// \brief set the query reformulation parameters.
      /// @param p the Parameters object containing the parameters.
      void setFormulationParameters(Parameters &p);

