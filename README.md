

## Installation

Build the container
with 

`singularity build autosubmit.sif ContainerRecipes/autosubmit.def`
Or install autosubmit using pip or conda 

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $PWD/m3 && $PWD/m3/bin/pip3 install autosubmit
```



## Initial setup

**Edit `DefaultConfigs/platforms.yml` and set `USER` and `PROJECT` to an account and project which is available for you on Lumi.** 
Before starting

Add autosubmit to `PATH` either using the container `export PATH="$PWD/bin:$PATH"`
or `export PATH="$PATH:$PWD/m3/bin/"` if using the conda installation or
then your own installation


```bash
# Only needed if using the container
touch .autosubmitrc
# Configure and install autosubmit
autosubmit configure -db $PWD/AUT -dbf autosubmit.db -lr $PWD/AUT -pc $PWD/DefaultConfigs -jc $PWD/DefaultConfigs 
autosubmit install
```


## Setup for example job

```bash
expid=$(autosubmit expid -H "lumi-debug" -d "Example" | grep "experiment \".*[^\"]\"" | cut -d '"' -f2 )
sed -i "s/PROJECT_TYPE.*/PROJECT_TYPE: local/g" $PWD/AUT/$expid/conf/expdef_$expid.yml
sed -i "s@PROJECT_PATH.*@PROJECT_PATH: scripts@g" $PWD/AUT/$expid/conf/expdef_$expid.yml
mkdir -p $PWD/AUT/$expid/proj/scripts
cp TaskScripts/* $PWD/AUT/$expid/proj/scripts
```

## Running

`autosubmit run <expid>` (replace `<expid>` with e.g a000 )
