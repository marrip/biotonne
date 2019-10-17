#!/bin/bash

# Define tool list
TWOR=( fastqc flye guppy mlst racon spades unicycler )
TWR=( abricate busco kmerfinder prokka quast )

# Define wrapping function
wrapping () {
  local SPEC="$1";
  shift;
  local ARR=("$@");
  for tool in "${ARR[@]}"; do
    printf "#!/bin/bash\n\n# Setup env\nIFLAG=false\nOFLAG=false\nREPO_PATH=/home/marrip/Documents/git_repos/biotonne\nUSER_PATH=\$(pwd)\n" > $tool/$tool;
    cat $tool/conf.spec >> $tool/$tool;
    printf "\n\n" >> $tool/$tool;
    cat $SPEC >> $tool/$tool;
    chmod a+x $tool/$tool;
    echo "Wrapper for $tool was generated."
  done
}

wrapping twor.spec ${TWOR[@]};
wrapping twr.spec ${TWR[@]};
