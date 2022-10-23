{ 
  hostname = "$(hostname)";
  operatingSystem = "$(uname -v | awk '{ print $1 }' | sed 's/#.*-//')";
}
