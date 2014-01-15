#from subprocess import call
import os

cc="g++"
target="output"
srcs=["test.cpp","base.cpp"]
cflags="-c"
build_dir="build"
link_flag=""
blank=" "



def compile():
	compile_string = cc+" "+cflags
	for s in srcs:
		filename=""
		if s.endswith(".cpp") :
			filename=s[:-4]
		elif s.endswith(".c"):
			filename=s[:-2]

		print("Compiling: "+filename);
		os.system(compile_string+" "+s+" -o ./"+build_dir+"/"+filename+".o")


def clean():
	if(os.path.isdir("./"+build_dir)):
		directory=os.getcwd()+"/"+build_dir;
		print("Current working directory is : "+os.getcwd());
		for files in os.listdir(directory):
			if files.endswith(".o"):
				os.system("rm -f "+files)
	else:
		for files in os.listdir("."):
			if files.endswith(".o"):
				os.system("rm -f "+files)

def link():
	objs=blank
	for files in os.listdir("./"+build_dir):
		if files.endswith(".o"):
			objs+=files
			objs +=" "
	
	print("Object list : "+objs)
	os.chdir(os.getcwd()+"/"+build_dir)
	os.system(cc+blank+objs+" -o "+target)



compile();
link();
#clean();



