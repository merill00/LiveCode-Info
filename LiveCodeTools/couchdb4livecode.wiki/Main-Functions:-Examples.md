```HTTP API Reference


/	
GET /	Returns the welcome message and version information
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(slash,tURL)

/_active_tasks	
GET /_active_tasks	Obtains a list of the tasks running in the server
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(active_tasks,tURL)
 	
/_all_dbs	
GET /_all_dbs	Returns a list of all the databases
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(all_dbs,tURL)

/_config	
GET /_config	Obtains a list of the entire server configuration
   put "http://127.0.0.1:5984/" into tURL
   put couch.get(config,tURL)
   
/_config/{section}	
GET /_config/{section}	Returns all the configuration values for the specified section
   put "http://127.0.0.1:5984/" into tURL
   put "uuids" into tOptions["section"]
   put couch.get(config,tURL,,,,tOptions)

/_config/{section}/{key}	
GET /_config/{section}/{key}	Returns a specific section/configuration value
   put "http://127.0.0.1:5984/" into tURL
   put "uuids" into tOptions["section"]
   put "algorithm" into tOptions["key"]
   put couch.get(config,tURL,,,,tOptions)

PUT /_config/{section}/{key}	Sets the specified configuration value
   put "http://127.0.0.1:5984/" into tURL
   put "uuids" into tOptions["section"]
   put "algorithm" into tOptions["key"]
   put "random" into tOptions["value"]
   put couch.put(config,tURL,,,,tOptions)

DELETE /_config/{section}/{key}	Removes the current setting
   put "http://127.0.0.1:5984/" into tURL
   put "uuids" into tOptions["section"]
   put "algorithm" into tOptions["key"]
   put couch.delete(config,tURL,,,,tOptions)


/_db_updates	
GET /_db_updates	Return the server changes of databases
     put "http://127.0.0.1:5984/" into tURL
     put couch.get("db_updates",tURL)

/_log	
GET /_log	Returns the server log file
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(log,tURL)
     
/_replicate	
POST /_replicate	Starts or cancels the replication
     put "http://127.0.0.1:5984/" into tURL
     put "test1" into tDoc["source"]
     put "http://192.168.42.23:5984/test2" into tDoc["target"]
     put couch.post(restart,tURL,,tDoc)
     
/_restart	
POST /_restart	Restarts the server
     put "http://127.0.0.1:5984/" into tURL
     put couch.post(restart,tURL)
  
/_session	
GET /_session	Returns Cookie-based login user information
     put "http://127.0.0.1:5984/" into tURL
     put couch.get("session",tURL) into tInfo

POST /_session	Authenticates user by Cookie-based user login
     put "http://127.0.0.1:5984/" into tURL
     put "admin" into pDoc["name"]     
     put "passw0rd" into pDoc["password"]
     put couch.post("session",tURL,,pDoc) into theCookie
          ---returns a string with the cookie in it

DELETE /_session	Logout Cookie-based user
     put "http://127.0.0.1:5984/" into tURL
     put couch.delete("session",tURL) into tInfo

/_stats	
GET /_stats	Returns server statistics
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(stats,tURL)
 	
/_uuids	
GET /_uuids	Generates a list of UUIDs from the server
     put "http://127.0.0.1:5984/" into tURL
     put couch.get(uuids,tURL)
     

DATABASE API


/{db}	
GET /{db}	Returns the database information
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.get(db,tURL,tDB) 
POST /{db}	Creates a new document with generic ID if he had not specified
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "somedata" into tDoc["somekey"]
     put "otherdata" into tDoc["otherkey"]
     put couch.post(db,tURL,tDB,tDoc)
PUT /{db}	Creates a new database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.put(db,tURL,tDB)
DELETE /{db}	Deletes an existing database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb2" into tDB
     put couch.delete(db,tURL,tDB)
 	
/{db}/_all_docs	
GET /{db}/_all_docs	Returns a built-in view of all documents in this database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.get(all_docs,tURL,tDB)
POST /{db}/_all_docs	Returns certain rows from the built-in view of all documents
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "c3f2c12bc8c242826e1849097900091d" into tDocIDs["keys"][1]
     put "c3f2c12bc8c242826e1849097900358d" into tDocIDs["keys"][2]
     put couch.post(all_docs,tURL,tDB,tDocIDs)
      
/{db}/_bulk_docs	
POST /{db}/_bulk_docs	Inserts or updates multiple documents in to the database in a single request
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "somedata" into tDoc[1]["somekey"]
     put "otherdata" into tDoc[1]["otherkey"]
     put "somedata2" into tDoc[2]["somekey"]
     put "otherdata2" into tDoc[2]["otherkey"]
     put couch.post(bulk_docs,tURL,tDB,tDoc) into tZZZ
      
/{db}/_changes	
GET /{db}/_changes	Returns changes for the given database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.get(changes,tURL,tDB)
POST /{db}/_changes	Returns changes for the given database for certain document IDs
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "c3f2c12bc8c242826e1849097900091d" into tDocIDs["doc_ids"][1]
     put "c3f2c12bc8c242826e1849097900358d" into tDocIDs["doc_ids"][2]
     put couch.post(changes,tURL,tDB,tDocIDs)
      
/{db}/_compact	
POST /{db}/_compact	Starts a compaction for the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.post(compact,tURL,tDB)

/{db}/_compact/{ddoc}	
POST /{db}/_compact/{ddoc}	Starts a compaction for all the views in the selected design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put couch.post(compactdesign,tURL,tDB,tDocID)
      
/{db}/_ensure_full_commit	
POST /{db}/_ensure_full_commit	Makes sure all uncommitted changes are written and synchronized to the disk
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.post(ensure_full_commit,tURL,tDB)
      
/{db}/_local/{docid}	
GET /{db}/_local/{docid}	Returns the latest revision of the non-replicated document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "0dc77cd3-389b-43c1-aef4-e2a5a31eef72" into tDocID
     put couch.get("localdoc",tURL,tDB,tDocID)

PUT /{db}/_local/{docid}	Inserts a new version of the non-replicated document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "somedata" into tDoc["somekey"]
     put "otherdata" into tDoc["otherkey"]
     put couch.put("localdoc",tURL,tDB,tDoc)  

DELETE /{db}/_local/{docid}	Deletes the non-replicated document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "0dc77cd3-389b-43c1-aef4-e2a5a31eef72" into tDocID
     put "1-e0af530ae2775044d7b2db4c91cc18a1" into tParams["rev"]
     put couch.delete("localdoc",tURL,tDB,tDocID,tParams)      

/{db}/_missing_revs	
POST /{db}/_missing_revs	By given list of document revisions, returns the document revisions that do not exist in the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "c3f2c12bc8c242826e1849097900091d" into tID
     put "3-b06fcd1c1c9e0ec7c480ee8aa467bf3b" into tDoc[tID][1]
     put "4-0e871ef78849b0c206091f1a7af6ec41" into tDoc[tID][1]
     put couch.post("missings_revs",tURL,tDB,tDocIDs)
     
/{db}/_purge	
POST /{db}/_purge	Purges some historical documents entirely from database history
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "c3f2c12bc8c242826e1849097900091d" into tID
     put "4-dc8088c3be9d44b41f87ba1470064672" into tDoc[tID][1]
     put couch.post(purge,tURL,tDB,tDoc)
   
/{db}/_revs_diff	
POST /{db}/_revs_diff	By given list of document revisions, returns differences between the given revisions and ones that are in the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "c3f2c12bc8c242826e1849097900091d" into tID
     put "3-b06fcd1c1c9e0ec7c480ee8aa467bf3b" into tDoc[tID][1]
     put "4-0e871ef78849b0c206091f1a7af6ec41" into tDoc[tID][1]
     put couch.post("revs_diff",tURL,tDB,tDocIDs)
     
/{db}/_revs_limit	
GET /{db}/_revs_limit	Returns the limit of historical revisions to store for a single document in the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.get(revs_limit,tURL,tDB)
PUT /{db}/_revs_limit	Sets the limit of historical revisions to store for a single document in the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.put(revs_limit,tURL,tDB,500)

/{db}/_security	
GET /{db}/_security	Returns the special security object for the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.get(security,tURL,tDB)
PUT /{db}/_security	Sets the special security object for the database
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "uber" into tDoc["admins"]["names"][1]
     put "admins" into tDoc["admins"]["roles"][1]
     put "user" into tDoc["members"]["names"][1]
     put "developer" into tDoc["members"]["roles"][1]
     put couch.put(security,tURL,tDB,tDoc)
 	
/{db}/_temp_view	
POST /{db}/_temp_view	Executes a given view function for all documents and returns the result
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
 	  put "function(doc) { if (doc.value) { emit(doc.value, null); } }" into tDoc["map"] 
     put "_count" into tDoc["_reduce"]
     put couch.post("temp_view",tURL,tDB,tDoc)
 	
/{db}/_view_cleanup	
POST /{db}/_view_cleanup	Removes view files that are not used by any design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put couch.post("view_cleanup",tURL,tDB)
 	
DOCUMENT API
  
/{db}/{docid}	
GET /{db}/{docid}	Returns the documentrr
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "0dc77cd3-389b-43c1-aef4-e2a5a31eef72" into tDocID
     put couch.get(doc,tURL,tDB,tDocID)
PUT /{db}/{docid}	Creates a new document, or new version of an existing document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "somedata" into tDoc["somekey"]
     put "otherdata" into tDoc["otherkey"]
     put couch.put(doc,tURL,tDB,tDoc)
DELETE /{db}/{docid}	Deletes the document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "0dc77cd3-389b-43c1-aef4-e2a5a31eef72" into tDocID
     put "1-e0af530ae2775044d7b2db4c91cc18a1" into tParams["rev"]
     put couch.delete(doc,tURL,tDB,tDocID,tParams)

/{db}/{docid}/{attname}	
GET /{db}/{docid}/{attname}	Gets the attachment of a document     
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "thisdoc" into tDocID
     put "my_cat.jpg" into tOptions["attachment"]
     put couch.get(attach,tURL,tDB,tDocID)

PUT /{db}/{docid}/{attname}	Adds an attachment of a document
     put "http://127.0.0.1:5984/" into tURL
     put "test_suite_db2" into tDB
     put "zxsd3324d" into tOptions["docid"]
     put "my_cat.jpg" into tOptions["attachname"]
     put "1-465aa47fc9a072e79d5898a3257acb4c" intp tParams["rev"]
     put "/User/pink/testdata/my_cat.jpg" into tOptions["attachpath"]
     put "image/jpg" into tOptions["attachtype"]
     put "bin" into tOptions["attachmode"]
     put couch.get(attach,tURL,tDB)

DELETE /{db}/{docid}/{attname}	Deletes an attachment of a document
     put "http://127.0.0.1:5984/" into tURL
     put "test_suite_db2" into tDB
     put "zxsd3324d" into tDocID
     put "my_cat.jpg" into tOptions["attachment"]
     put "1-465aa47fc9a072e79d5898a3257acb4c" intp tParams["rev"]
     put couch.delete(attach,tURL,tDB,tDocID)

DESIGN DOCUMENT API

/{db}/_design/{ddoc}	
GET /{db}/_design/{ddoc}	Returns the design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put couch.get(design,tURL,tDB,tDocID)
PUT /{db}/_design/{ddoc}	Creates a new design document, or new version of an existing one
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc2" into pDoc["_id"]
     put "javascript" into pDoc["language"]
     put "function(doc) {"&cr&"  emit(null, doc);"&cr&"}" into pDoc["views"]["myquery"]["map"]
     put couch.put(design,tURL,tDB,pDoc)
DELETE /{db}/_design/{ddoc}	Deletes the design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "myviewdoc" into tDocID
     put "1-e0af530ae2775044d7b2db4c91cc18a1" into tParams["rev"]
     put couch.delete(design,tURL,tDB,tDocID,tParams)
     
/{db}/_design/{ddoc}/_info	
GET /{db}/_design/{ddoc}/_info	Returns view index information for the specified design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "info" into tOptions["ddoc"]["func"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz
   
/{db}/_design/{ddoc}/_list/{func}/{other-ddoc}/{view}	
GET /{db}/_design/{ddoc}/_list/{func}/{other-ddoc}/{view}	Executes a list function against the view from other design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "list" into tOptions["ddoc"]["func"]
     put "myspeciallist" into tOptions["ddoc"]["name"]
     put "otherdoc" into tOptions["ddoc"]["otherdoc"]  
     put "view" into tOptions["ddoc"]["otherfunc"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz
     
POST /{db}/_design/{ddoc}/_list/{func}/{other-ddoc}/{view}	
     The same as GET
 	
/{db}/_design/{ddoc}/_list/{func}/{view}	
GET /{db}/_design/{ddoc}/_list/{func}/{view}	Executes a list function against the view from the same design document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "list" into tOptions["ddoc"]["func"]
     put "myspeciallist" into tOptions["ddoc"]["name"]
     put "view" into tOptions["ddoc"]["otherdoc"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz
POST /{db}/_design/{ddoc}/_list/{func}/{view}	
     The same as GET
 	
/{db}/_design/{ddoc}/_show/{func}	
GET /{db}/_design/{ddoc}/_show/{func}	Executes a show function against null document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "show" into tOptions["ddoc"]["func"]
     put "myshowfunc" into tOptions["ddoc"]["name"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz
POST /{db}/_design/{ddoc}/_show/{func}	
     The same as GET

/{db}/_design/{ddoc}/_show/{func}/{docid}	
GET /{db}/_design/{ddoc}/_show/{func}/{docid}	Executes a show function against the specified document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "show" into tOptions["ddoc"]["func"]
     put "myshowfunc" into tOptions["ddoc"]["name"]
     put "4743824238423947234984" into tOptions["ddoc"]["othername"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz
POST /{db}/_design/{ddoc}/_show/{func}/{docid}	
     The same as GET

/{db}/_design/{ddoc}/_update/{func}	
POST /{db}/_design/{ddoc}/_update/{func}	Executes an update function
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "updatedoc" into tOptions["docid"]
     put "update" into tOptions["ddoc"]["func"]
     put "myupdatefunc" into tOptions["ddoc"]["name"]
     put couch.post(design,tURL,tDB,,tOptions) into zzz
     
/{db}/_design/{ddoc}/_update/{func}/{docid}	
PUT /{db}/_design/{ddoc}/_update/{func}/{docid}	Executes an update function against the specified document
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "update" into tOptions["ddoc"]["func"]
     put "myview" into tOptions["ddoc"]["name"] 
     put "ssdd98r98t443e" into tOptions["ddoc"]["otherdoc"]
     put couch.put(design,tURL,tDB,tDocID,tOptions) into zzz
     
/{db}/_design/{ddoc}/_view/{view}	
GET /{db}/_design/{ddoc}/_view/{view}	Returns results for the specified stored view
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tDocID
     put "view" into tOptions["ddoc"]["func"]
     put "myview" into tOptions["ddoc"]["name"]
     put couch.get(design,tURL,tDB,tDocID,tOptions) into zzz

POST /{db}/_design/{ddoc}/_view/{view}	Returns certain rows for the specified stored view
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "testdoc" into tOptions["docid"]
     put "view" into tOptions["ddoc"]["func"]
     put "myview" into tOptions["ddoc"]["name"]
     put "case0001" into tDoc["keys"][1]
     put "case0002" into tDoc["keys"][2]   
     put couch.post(design,tURL,tDB,tDoc,tOptions) into zzz
     
     
/{db}/_design/{ddoc}/{attname}	
GET /{db}/_design/{ddoc}/{attname}	Gets the attachment of a design document  
     put "http://127.0.0.1:5984/" into tURL
     put "testdb" into tDB
     put "thisddoc" into tDocID
     put "my_cat.jpg" into tOptions["attachment"]
     put couch.get(design,tURL,tDB,tDocID)

PUT /{db}/_design/{ddoc}/{attname}	Adds an attachment of a design document
     put "http://127.0.0.1:5984/" into tURL
     put "test_suite_db2" into tDB
     put "_design/mydesigndoc" into tOptions["docid"]
     put "my_cat.jpg" into tOptions["attachname"]
     put "1-465aa47fc9a072e79d5898a3257acb4c" intp tParams["rev"]
     put "/User/pink/testdata/my_cat.jpg" into tOptions["attachpath"]
     put "image/jpg" into tOptions["attachtype"]
     put "bin" into tOptions["attachmode"]
     put couch.get(attach,tURL,tDB)

DELETE /{db}/_design/{ddoc}/{attname}	Deletes an attachment of a design document
     put "http://127.0.0.1:5984/" into tURL
     put "test_suite_db2" into tDB
     put "myddoc" into tDocID
     put "my_cat.jpg" into tOptions["attachment"]
     put "1-465aa47fc9a072e79d5898a3257acb4c" intp tParams["rev"]
     put couch.delete(design,tURL,tDB,tDocID)
