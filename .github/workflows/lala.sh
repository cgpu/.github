prefix="adds-"
suffix="-data"
for i in $(git branch --all | cut -d "/" -f 3 | grep adds | grep -v HEAD ); do echo  $i | sed 's/adds-//' | sed 's/-data//'  >> branches.txt; done
for i in $(cat branches.txt | uniq) ; do git checkout adds-$i-data  && git branch -m $i && git push origin -u $i && git push origin --delete  adds-$i-data ; done


prefix="adds-"
suffix="-data"

for i in $(git branch --all \
| cut -d "/" -f 3 \
| grep ${prefix} \
| grep -v HEAD \
); \
do \
echo  $i \
| sed "s/${prefix}//" \
| sed "s/${suffix}//" \
| grep -v "\*" \
>> branches.txt \
;
done 

for i in $(cat branches.txt \
| uniq) \
; \
do git checkout ${prefix}${i}${suffix} && \
git branch -m $i && \
git push origin -u $i && \
git push origin --delete  ${prefix}${i}${suffix} ; \
done
