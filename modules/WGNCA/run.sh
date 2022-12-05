#
#
# Build networks w/ WGNC
# created: 221203
#
# -------------------------------



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR



readCounts=( $(ls ${DIR}/../../data/*Rdata))

for rc in ${readCounts[@]}
do
    echo running ${rc}          
    Rscript Main.R ${rc}
done
