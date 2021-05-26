import yaml,sys,getopt



def usage():
    return "strimziToCluster filename"

if __name__ == "__main__":
    print("-------------------------")
    try:
        opts,args = getopt.getopt(sys.argv,"-f")
    except getopt.GetoptError:
        print(usage())
        sys.exit(2)
    
    with open(args[1]) as file:
        strimziClusterDef = yaml.load(file, Loader=yaml.FullLoader)
        # print(strimziClusterDef)
        print(strimziClusterDef["metadata"]["name"])