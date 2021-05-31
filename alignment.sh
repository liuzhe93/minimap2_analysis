#git clone https://github.com/lh3/minimap2
minimap2 -ax map-ont reference.fa GZ.fq > GZ.sam
samtools idxstats file.sam
canu -p GZ_asb1 -d ./result_dir genomeSize=16569 minReadLength=100 minOverlapLength=50 -nanopore-raw GZ.fq
minimap2 -ax map-ont -t 40 result_dir/GZ_asb1.unitigs.fasta GZ.fq |samtools sort -T tmp1 -o result_dir/GZ_asb1.sorted.bam -
nanopolish vcf2fasta --skip-checks -g GZ_asb1.unitigs.fasta  GZ_asb1.polished.vcf > GZ_asb1_polished_genome.fa
MUMmer3.23/dnadiff --prefix GZ_asb1_polished.dnadiff reference.fa GZ_asb1_polished_genome.fa
