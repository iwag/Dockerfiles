

load "Conffile.rb"

task :build do
	roles.each do |i|
		dockerpath = Conf[:dockerdir] + "/" + i
		puts "start builing " + dockerpath
		sh "cd #{dockerpath} && docker build -t #{i} ."
	end
end

task :config do
	nodes.each do |node|
	   tag = roleByNode(node)
		sh "docker run --name #{node} -d #{tag}"
		puts `docker inspect --format='{{.NetworkSettings.IPAddress}}' #{node} `.chomp
	end
end

task :stop do
	sh "docker ps"
	nodes.each do |node|
		sh "docker stop #{node}"
		sh "docker rm #{node}"
	end
end
