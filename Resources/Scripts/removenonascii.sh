tr -cd '\11\12\15\40-\176' < ztrace100-randomized-alltokens.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-alltokens.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-alltokens-test.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-alltokens-test.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-alltokens-train.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-alltokens-train.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-alltokens-valid.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-alltokens-valid.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-alltokens-valid-test.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-alltokens-valid-test.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-uniquetokens.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-uniquetokens.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-uniquetokens-test.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-uniquetokens-test.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-uniquetokens-train.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-uniquetokens-train.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-uniquetokens-valid.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-uniquetokens-valid.tsv

tr -cd '\11\12\15\40-\176' < ztrace100-randomized-uniquetokens-valid-test.tsv > xxx.tsv
mv xxx.tsv ztrace100-randomized-uniquetokens-valid-test.tsv
