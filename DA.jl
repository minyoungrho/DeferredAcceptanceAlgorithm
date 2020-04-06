
###
### algorithm/function
###


tic()
DA = zeros(Array{Int64}(size(mainRportfolio,1),size(directory,1)))
slots = ones(Array{Int64}(size(mainRportfolio,1)))
slots[find(mainRportfolio[:,1].=="0")] = 0

unmatched = setdiff(find(sum(DA,2).==0),find(mainRportfolio[:,1].=="0"))
unmatchedportfolio = [mainRportfolio[i,slots[i]] for i in unmatched]

while !isempty(unmatched)


    for l in 1:size(directory,1)
        applicant = union(unmatched[find(unmatchedportfolio.==directory[l,:code])],find(DA[:,l].==1))
    if size(applicant,1)<=directory[l,:mainRaccept]
        DA[applicant,l] = 1
    else
        accept = applicant[sortperm(schoolpref[applicant,l])[1:directory[l,:mainRaccept]]]
        reject = setdiff(applicant,accept)
        DA[accept,l] = 1
        DA[reject,l] = 0

        slots[reject] = slots[reject]+1
    end
    end

    unmatched = setdiff(find(sum(DA,2).==0),find(mainRportfolio[:,1].=="0"))
    unmatched = unmatched[find(slots[unmatched].<=12)]
    unmatchedportfolio = [mainRportfolio[i,slots[i]] for i in unmatched]

    unmatched = unmatched[find(unmatchedportfolio.!="0")]
    unmatchedportfolio = unmatchedportfolio[find(unmatchedportfolio.!="0")]

    println(length(unmatched))

end
toc()  #17 seconds

match[:mainRDA] = fill!(Array{String,1}(size(DA,1)),"0")
for i in find(sum(DA,2).>0)
    match[i,:mainRDA] = directory[find(DA[i,:].==1)[1],:code]
end
#= model fit
StatsBase.proportionmap(match[find(mainRportfolio[:,1].!="0"),:mainRmatch].==match[find(mainRportfolio[:,1].!="0"),:mainRDA])
=#

###
###

tic()
DA = zeros(Array{Int64}(size(supplementaryRportfolio,1),size(directory,1)))
slots = ones(Array{Int64}(size(supplementaryRportfolio,1)))
slots[find(supplementaryRportfolio[:,1].=="0")] = 0

unmatched = setdiff(find(sum(DA,2).==0),find(supplementaryRportfolio[:,1].=="0"))
unmatchedportfolio = [supplementaryRportfolio[i,slots[i]] for i in unmatched]

while !isempty(unmatched)


    for l in 1:size(directory,1)
        applicant = union(unmatched[find(unmatchedportfolio.==directory[l,:code])],find(DA[:,l].==1))
    if size(applicant,1)<=directory[l,:supplementaryRaccept]
        DA[applicant,l] = 1
    else
        accept = applicant[sortperm(schoolpref[applicant,l])[1:directory[l,:supplementaryRaccept]]]
        reject = setdiff(applicant,accept)
        DA[accept,l] = 1
        DA[reject,l] = 0

        slots[reject] = slots[reject]+1
    end
    end

    unmatched = setdiff(find(sum(DA,2).==0),find(supplementaryRportfolio[:,1].=="0"))
    unmatched = unmatched[find(slots[unmatched].<=12)]
    unmatchedportfolio = [supplementaryRportfolio[i,slots[i]] for i in unmatched]

    unmatched = unmatched[find(unmatchedportfolio.!="0")]
    unmatchedportfolio = unmatchedportfolio[find(unmatchedportfolio.!="0")]

    println(length(unmatched))

end
toc()  #17 seconds

match[:supplementaryRDA] = fill!(Array{String,1}(size(DA,1)),"0")
for i in find(sum(DA,2).>0)
    match[i,:supplementaryRDA] = directory[find(DA[i,:].==1)[1],:code]
end

#= model fit
StatsBase.proportionmap(match[find(supplementaryRportfolio[:,1].!="0"),:supplementaryRmatch].==match[find(supplementaryRportfolio[:,1].!="0"),:supplementaryRDA])
=#
