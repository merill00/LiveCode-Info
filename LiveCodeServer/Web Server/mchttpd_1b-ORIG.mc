#!/bin/sh
# MetaCard 2.3 stack
# The following is not ASCII text,
# so now would be a good time to q out of more
exec mc $0 "$@"
                                                                                                                                  � MCHTTPd � �)local theRoot, rootDir,IPaddress,cgiSuffix,fileSuffix,w,z,pFile,htmlAnswer
local portNum,t,n,r,f,temp,theResult,thePort,aList,suffix,xFile,settings,newsettings,cgiStacks,dotSuffix
local stacksDir
global scriptResult,oDir,locDir,logFile

##This handler reads the MChttpd.conf for preferences and puts them into variables

on preopenstack
  if the short name of this stack is "MCHTTPd" then
    get the effective fileName of this stack
    set the itemDel to "/"
    delete last item of it
    set the directory to it
    put the directory into oDir
    set the title of group "Local" of cd 2 of  stack  "MCHTTPd" to "Root: "& oDir
    makeList
    -- set explicitVariables to true
    get the openSockets
    if it is empty then
      set the hilite of btn "status" of group "status" of stack "MCHTTPd" to true
      set the label of btn "start_stop" of group "ss" of stack "MCHTTPd" to "START SERVER"
    end if
    put "file:"& oDir & "/MChttpd.conf" into locDir
    put "file:"& oDir & "/MChttpd.log" into logFile
    put empty into fld "read" of cd 1 of stack "MCHTTPd"
    set the twelveHourTime to false
    put url locDir into settings
    put word 2 to 5 of (line 2 of settings) into fld "host" of group "Port" of cd 1 of stack "MCHTTPd"
    put word 2 to 5 of (line 3 of settings) into fld "cgi-set" of cd 2 of stack "MCHTTPd"
    put word 2 to 5 of (line 3 of settings) into cgiSuffix
    put word 2 to 5 of (line 4 of settings) into fld "file-set" of cd 2 of stack "MCHTTPd"
    put word 2 to 5 of (line 4 of settings) into fileSuffix
  end if
end preopenstack

on makeList
  put the directories & cr & the files into fld "local" of cd 2 of stack "MCHTTPd"
  repeat with i=1 to the num of lines of the directories
    set the textColor of line i of fld "local"  of cd 2 of stack "MCHTTPd" to "blue"
  end repeat
end makeList

on get_fileNames
  put empty into cgiStacks
  set the directory to oDir & "/cgi-bin"
  put the files into aList
  set the directory to oDir & "/html"
  put cr & the files after aList
  set the directory to oDir
  put oDir & "/stacks-bin" into stacksDir
end get_fileNames

on resizeStack
  if the short Name of this stack is "MCHTTPd" then
    put the rect of group "tabs" into t
    put the rect of group "log" of cd 1 into n
    put the rect of fld "read" of cd 1 into r
    put the rect of btn "options" of cd 2 into f
    set the rect of group "tabs" to item 1 of t,item 2 of t,the width of me, the height of me
    set the rect of btn "options" of cd 2 to item 1 of f,item 2 of f,the width of me-3, the height of me-3
    set the rect of group "log" of cd 1 to item 1 of n,item 2 of n,the width of me-8, the height of me-10
    set the rect of fld "read" of cd 1 to item 1 of r,item 2 of r, the width of me-14,the height of me-14
    set the rect of btn "tabs" to the rect of group "tabs"
  end if
end resizeStack


on answerError404--HTTP error we all went across on the web
  return  the err404  of me
end answerError404

on answerError400
  # return  the err400  of me
end answerError400

##This is the main script.##

on startServer
  put  fld "host" of group "Port" of stack "MCHTTPd" into portNum
  if the label of btn "start_stop" of group "ss"  of stack "MCHTTPd" is "START SERVER"
  then
    ## tell the server what port to listen to and what message to use for incoming calls
    accept connections on port portNum with message "newconnect"
    if the result is not empty then put the result
    set the hilite of btn "status" of group "status" to false
    set the label of btn "start_stop" of group "ss" of stack "MCHTTPd" to "STOP SERVER"
    get_fileNames
  else
    get the openSockets
    repeat with i=1 to the num of lines in it
      close socket (line i of it)
    end repeat
    set the hilite of btn "status" of group "status"  of stack "MCHTTPd" to true
    set the label of btn "start_stop" of group "ss" of stack "MCHTTPd" to "START SERVER"
  end if
end startServer

on socketTimeout
  -- close socket w
end socketTimeout

##reading  the request from a new socket

on newconnect s
  read from socket s for 1 line with message "serverread"
end newconnect

#processing the request
on serverread x,y
  put x into w
  put y into z ## need to add support for POST
  put word 2 of y into pFile
  delete char 1 of pFile
  put offset(".",pFile) into dotSuffix
  if pFile is empty then
    put "index.html" into pFile
    if the platform is "MacOS" then   put "binfile:" & oDir  & "/html/" & pFile into xFile
    else put "file:"& oDir  & "/html/" & pFile into xFile
    write url xFile to socket w
    logOK
    close socket x
    exit serverread
  end if
  
  switch
  case dotSuffix is "0"
    set the directory to stacksDir
    if there is a stack pFile then
      start using  stack pFile
      send pFile to stack pFile
      write cr & cr & scriptResult to socket w
      logOK
      close socket x
      set the directory to oDir
      exit serverread
    else
      answerError404
      put cr & cr & the result into theResult
      ## answer the client
      write theResult  to socket x
      put cr & "404 Not Found" && the date && the long time && z  after fld "read" of cd 1##update the log
      if the label of btn "log" of cd 2 is "Save log" then put cr & "404 Not Found" && \
          the date && the long time && z  after url logFile
      close socket x
      exit serverread
      set the directory to oDir
    end if
    
  case dotSuffix is not empty
    set wholeMatches to true
    ##searching for the requested file to serve
    get lineOffset(pFile,aList)
    if it is not 0 then
      ##determining if the file is an executable (cgi) and processing it accordingly
      getSuffix
      close socket x
    else
      ##the file doesn't exist
      answerError404
      put cr & cr & the result into theResult
      ## answer the client
      write theResult  to socket x
      put cr & "404 Not Found" && the date && the long time && z  after fld "read" of cd 1##update the log
      if the label of btn "log" of cd 2 is "Save log" then put cr & "404 Not Found" && \
          the date && the long time && z  after url logFile
      close socket  x
    end if
  end switch
end serverread

on getSuffix
  set wholeMatches to true
  set itemDel to "."
  put "."& last item of pFile into suffix
  set itemDel to ","
  get itemOffset(suffix,cgiSuffix)
  if it is not 0 then
    set the directory to oDir &"/cgi-bin"
    put oDir & "/cgi-bin/" & pFile into pFile
    open process pFile
    read from process pFile until eof
    write it to socket w
    logOK
    set the directory to oDir
  else
    get itemOffset(suffix,fileSuffix)
    if the platform is "MacOS" then    put "binfile:"& oDir & "/html/" & pFile into xFile
    else  put "file:"& oDir & "/html/" & pFile into xFile
    write url xFile to socket w
    #  write  xFile to stdout
    logOK
  end if
end getSuffix

on logOK
  put cr & "200 OK" && the date && the long time && z  after fld "read" of cd 1 of stack "MCHTTPd"
  if the label of btn "log" of cd 2 of stack "MCHTTPd" is "Save log" then put cr &  "200 OK" && \
      the date && the long time && z  after url logFile
end logOK

#write preferences to file (MChttpd.conf)
on setPrefs
  put "Port= " & fld "host" of group "Port" of stack "MCHTTPd" into  line 2 of newsettings
  put fld "host" of group "Port" of stack "MCHTTPd" into portNum
  put "cgi= " & fld "cgi-set" of cd 2 of stack "MCHTTPd" into  line 3 of newsettings
  put fld "cgi-set" of cd 2 of stack "MCHTTPd" into cgiSuffix
  put  "file_type= " & fld "file-set" of cd 2 of stack "MCHTTPd" into  line 4 of newsettings
  put fld "file-set" of cd 2 of stack "MCHTTPd" into fileSuffix
  put newsettings into url locDir
end setPrefs

on closeStack
  if the short Name of this stack is "MCHTTPd" then
    put empty into fld "host" of group "Port" of cd 1 of stack "MCHTTPd"
    put empty into fld "cgi-set" of cd 2 of stack "MCHTTPd"
    put empty into fld "file-set" of cd 2 of stack "MCHTTPd"
  end if
end closeStack
  u        Black ffffff  � � �  white ������  � � �  	darkgray �  � �F�   err404  t<FONT size="25" color="#FF0000">-404 -</FONT><P><FONT size="17"><B>File not found on this MCHTTPd Server!</B></FONT>err400  Z<FONT size="25" color="#FF0000">-400-</FONT>
<P><FONT size="17"><B>Bad request!</B></FONT>            ����     U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica  @U 
Helvetica   U 
Helvetica   W 
Helvetica   W 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica  
 U 
Helvetica   U 
Helvetica   U 
Helvetica  W 
Helvetica  U 
Helvetica  WanswerClient,/HD/Desktop Folder/MetaCard 2.3B2/New-MCHTTPD/stacks-bin/answerclient.mc
   � Log   	@  ������        F�    
    "  #  6   	Settings   	@  ������        F�  l  "      #  v  6  �  " status  i`  ������    � , 0 0      � status BR�       � 0 ( (  �  �         	  �	  	       6   h  0 ������  ������     ��� � "        
  �   
   ������     ��� �             MetaCard HTTP Server 
  �   
   ������     ��� �             MetaCard HTTP Server    Port  i   ������     � % � 7
  � host  )h         � 8 �            8080    tabs  i   ������       F�          � tabs ��	5 Ton menuPick newtab,oldtab
  go cd (newtab)
end menuPick

on mouseUp
  
end mouseUp
          F�       Log
Settings        	       
 log  i   ������      q3J
  � read  �)h          �'1        �    �    `      $ � 1  l options ��	}   Ton menuPick newtab,oldtab
  show group (newtab)
  hide group (oldtab)
end menuPick
         d=\       FILE TYPES
DIRECTORIES        	       v FILE TYPES   i         �  � SAVE SETTINGS �M�x   #on mouseUp
  setPrefs
end mouseUp
       �Z h               	     
  � info  h   
 ������  ��      @  � � � X         �These settings specify which file types are to be "served" as is (html, image) or executed (cgis) and the result returned to the client.   � Save server activity to file   i         � � ,  �    i         � � $  � log ��u Hon mouseUp
  set the label of me to the selectedText of me
end mouseUp
         � �      Don't save log    Save log
Don't save log        	       � Accept files  i         �� L
  � 	file-set  C)`  ������     #� 3         0.html,.htm,.gif,.GIF,.JPEG,.jpeg,.GPG,.gpg,.png     �    a       #$�   � Cgi suffix  i        O� 7
  � cgi-set  )`  ������     bz          	.mt,.cgi     � Timeout  i       x � � 5
  � timeout  )`      ~ � :          60 
  �  	       � � H            Seconds   � DIRECTORIES   a         � �  � Local  ,i(          �� � 'Root: C:/Program Files/MC2.3B3/mchttpd     
  � local  �)8  Glocal dir
global oDir

on mouseDoubleUp
  if the selectedText of fld "local" of cd 2 of stack "MCHTTPd" is in the directories then  goDir
  -- else sendFile
end mouseDoubleUp

on goDir
  put the directory into dir
  put the selectedText into dName
  -- if dName is in the directories then
  if dName is ".." then
    set the itemDel to "/"
if last item of dir is last item of oDir then
exit goDir
else
    delete last item of dir
    set the directory to dir
    makeList
end if
  else
    put dir & "/" & dName into dir
    set the directory to dir
    makeList
  end if
end goDir
               �| �           ..  @     �� blue     cgi-bin  @     �� blue     html  @     �� blue     stacks-bin  @     �� blue    
 MChttpd.conf  MChttpd.log  mchttpd_1b.mc   �           � �  �
  �  6
(    ��      @ � � � �           AThis field only shows the directory structure of MCHTTPd server.    .Root is the working directory of the server.   <Doubleclick on subdirectories' names to see their contents.   # ss   kH       }}��     ( ( � (  � New Button �C�w /on mouseUp
  modal "mchttpd info"
end mouseUp
        � ,      �         	       � start_stop �m�p (

on mouseUp
  startServer
end mouseUp
           ������     - . z      START SERVER          	       � mchttpd info    w        Black ������  ������  ������ white ������  ������    ?��            ����     W 
Helvetica   U 
Helvetica  U 
Helvetica  W 
Helvetica  W 
Helvetica  U 
Helvetica   U courier   �    	@          ��  �  �  �
  � f1  �	`  ������      ,wT          �This document describes the operation of the MCHTTPd server.  Note that most of the concepts discussed here also apply to servers for other protocols.  �A server listens on a specified port number for incoming requests from clients.  This listening process is started with the accept command.         |     |      � 
�To request data from a server, a client creates a socket to the server on the specified port.  When the socket connects, the client sends a request for the server to do something by writing to the socket.  In the case of HTTP, the client requests a file or sends in data from a form which is to be processed (typically by a Common Gateway Interface (CGI) application) and the file or result is returned to the client.  There are two ways a MetaCard application can transfer data with socket.  With the first method the command does not return until all the data has been read from or written two the socket.  This method is also known as "blocking I/O" and is best for short messages or fast networks. >With the second method, the read or write is done in the background and a message sent when the operation is complete.  This is a much more efficient method because other scripts can run while the data is being moved over the socket.  This is the method that all servers should use, and is the method used by MCHTTPd. 'When a read or write operation has completed and a message sent, one or two parameters are passed with it. The first parameter is the address of the system at the other end of the socket. The second parameter, passed only when a read operation has completed, is the actual data from the other system.  The basic flow in MCHTTPd is for the server to wait for a connection, start a read on that connection, process the request passed in the second parameter when the read completes, and write the answer to the client specified in the first parameter.  �For html files, which are retrieved with the HTTP GET command, only the first line of the request is really needed since it contains the file name the client wants.  For the HTTP POST command, all of the data is required since the data the client is uploading is on lines after the first one.  If a large amount of data is being posted to the server, more than one read command may be necessary to get it all (the total size is included in the header information).  �Since a server typically works with many files, a "root" directory is typically defined for it when it is installed.  MCHTTPd gets its "root" directory from the directory it is installed in. In their root directories, HTTP servers usually have an "html" directory where the web pages and images are stored and a "cgi-bin" directory for scripts which process data from HTML forms (note that .mt files only work on UNIX OSes).  MCHTTPd has a third directory, "stacks-bin", which contains stacks whose scripts it can call with start using  instead of typical cgis.This improves performance considerably and also makes scripting server-side applications much easier.  The MCHTTPd distribution contains a trivial example of such a stack.        M    M     X �>Please keep in mind that MCHTTPd is a work in progress and that many new features will be added as development continues.  You are encouraged to use the package as is, or to make modifications to it to suit your particular needs.  Feedback and copies of any modifications you make are welcome at support@metacard.com.   �    	`      k , T  � Close �E�x   5on mouseUp
  close stack "mchttpd info"
end mouseUp
       8  8              	     
  �        XXXXXX     h 	 �            MCHTTPd Web Server  