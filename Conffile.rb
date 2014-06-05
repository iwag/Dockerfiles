#!/usr/bin/ruby

Conf={
  roles:[
  {
    name:"java",
    repo:"api",
    build:"build.sh",
    nodes:["apifront","apimysql"]
  },
  {
    name:"mysql",
    nodes:["db-mysql"]
  },
  {
    name:"memcached",
    nodes:["db-memcached"]
  }
  ],
  dockerdir:"./"
}.freeze

def roles 
  Conf[:roles].map{|i| i[:name]}
end

def nodes
  Conf[:roles].map{|i| i[:nodes]}.flatten
end

def roleByNode(n)
  Conf[:roles].select{ |v| v[:nodes].any?{|u| u==n}}[0][:name]
end


