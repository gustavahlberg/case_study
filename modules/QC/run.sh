#
#
# Preprocess read counts.
# created: 221203
#
# -------------------------------



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR





readCounts=( $(ls ${DIR}/../../data/gene_reads*.gct.gz))

for rc in ${readCounts[@]}
do
    echo running ${rc}          
    Rscript Main.R ${rc}
done
