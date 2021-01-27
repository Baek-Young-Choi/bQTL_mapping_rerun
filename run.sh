# #Process Blood ATAC data
# #Dry run
# snakemake -np processed/out.txt
# #Cluster run
# snakemake --cluster scripts/snakemake_submit.py -p processed/out.txt --jobs 100

# #Process Macrophage ATAC data
# #Dry run
# snakemake -np macrophages/out.txt --configfile config_macrophages.yaml
# #Cluster run
# snakemake --cluster scripts/snakemake_submit.py -p macrophages/out.txt --jobs 100 --configfile config_macrophages.yaml


# #Process the CTCF dataset
# #Map QTLs
# snakemake --cluster scripts/snakemake_submit_UT.py -np -s map_QTLs.snakefile processed/CTCF/out.txt --jobs 1200 --configfile configs/config_CTCF.yaml

# #Identify failed output files
# snakemake --cluster scripts/snakemake_submit_UT.py -np -s map_QTLs.snakefile processed/CTCF/out.txt --jobs 600 --configfile configs/config_CTCF.yaml | grep "output: processed"


# #Process PU.1 data
# #Convert bams to fastq files
# snakemake --cluster scripts/snakemake_submit_UT.py -np processed/PU1/out.txt -s bam_to_fastq_SE.snakefile --configfile configs/config_PU1.yaml --jobs 5

# #Run the processing pipeline
# snakemake --cluster scripts/snakemake_submit_UT.py -np processed/PU1/out.txt -s ChIP_pipeline_SE.snakefile --configfile configs/config_PU1.yaml --jobs 5

# #Map QTLs
# snakemake --cluster scripts/snakemake_submit_UT.py -np -s map_QTLs.snakefile processed/PU1/out.txt --jobs 1200 --configfile configs/config_PU1.yaml

#Process PU.1 data
#Convert bams to fastq files
# snakemake processed/PU1/out.txt -s bam_to_fastq_SE.snakefile --configfile configs/config_PU1.yaml --cores 5

# Login for gcloud for google bucket access
# gcloud auth login

# #Run the processing pipeline
# snakemake -n processed/PU1/out.txt -s ChIP_pipeline_SE.snakefile -j 10 --configfile configs/config_PU1.yaml --cores 5

# Extract genotypes
# snakemake -s munge/PU1/extract_genotypes.snakefile munge/PU1/out.txt --configfile configs/config_PU1.yaml --cores 5

#Map QTLs
snakemake -s map_QTLs.snakefile processed/PU1/out.txt -j 10 --configfile configs/config_PU1.yaml  --cores 5