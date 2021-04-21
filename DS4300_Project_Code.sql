use disbiome;

create view disbiome_view1 as
select disease_name, organism_name, qualitative_outcome, count(organism_name) as num_pubs
from disbiome
group by disease_name, organism_name, qualitative_outcome
order by num_pubs desc;

create view disbiome_view2 as
select disease_id, disease_name, location_id, organism_name, organism_id, host_id, qualitative_outcome, 
host_type, count(disease_id) as num_pubs
from disbiome
group by disease_id, disease_name, location_id, organism_name, host_id, qualitative_outcome, host_type
order by num_pubs desc;

-- Which bacteria are the most heavily studied?
select organism_name, count(organism_id) as num_publications, sample_name
from disbiome
group by organism_name
order by num_publications desc;

-- Which diseases are the most heavily studied?
select disease_name, count(disease_id) as num_publications, sample_name
from disbiome
group by disease_name
order by num_publications desc;

-- Which bacterium is linked to the greatest number of diseases?
select distinct organism_name, count(disease_id) as num_diseases, sample_name
from disbiome
group by organism_id, disease_id
order by count(organism_id) desc;

