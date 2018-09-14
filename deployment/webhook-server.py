#!/usr/bin/python
from BaseHTTPServer import BaseHTTPRequestHandler,HTTPServer
import os

PORT_NUMBER = 8081



#This class will handles any incoming request from
#the browser 
class myHandler(BaseHTTPRequestHandler):

	#Handler for the GET requests
	def do_GET(self):
		print "hello"
		if self.path == '/':
			#os.system("bash /root/python/build-blog.sh")
			self.send_response(200)
			self.send_header('Content-type','text/html')
			self.end_headers()
			self.wfile.write('hello')
		elif self.path == '/personal-website':
			#os.system("bash /root/python/build-blog.sh")
			self.send_response(200)
			self.send_header('Content-type','text/html')
			self.end_headers()
			self.wfile.write('in the else')
		return

	def do_POST(self):
		if self.path == '/':
			self.send_response(200)
			self.send_header('Content-type','text/html')
			self.end_headers()
			self.wfile.write(self.path)
			os.system("bash /root/deployment/build-blog.sh")
		elif self.path == '/personal-website':
			os.system("bash /root/deployment/build-personal-website.sh >> /root/logs/logs.txt")
			self.send_response(200)
			self.send_header('Content-type','text/html')
			self.end_headers()
			self.wfile.write('in the post else')
		elif self.path == '/view-from-the-ra':
			self.send_response(200)
			self.send_header('Content-type','text/html')
			self.end_headers()
			self.wfile.write('view from the ra')
			os.system("bash /root/deployment/build-view-from-the-ra.sh")
		return

try:
	#Create a web server and define the handler to manage the
	#incoming request
	server = HTTPServer(('', PORT_NUMBER), myHandler)
	print 'Started httpserver on port ' , PORT_NUMBER

	#Wait forever for incoming htto requests
	server.serve_forever()

except KeyboardInterrupt:
	print '^C received, shutting down the web server'
	server.socket.close()
