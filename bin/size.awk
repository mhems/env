# Used by size wrapper to recursively count
#   accumulated size of directory's content

BEGIN {
    sum = 0
    suffix["G"] = 1000000000
    suffix["M"] = 1000000
    suffix["K"] = 1000
    suffix[""]  = 1
}
{
    match($2, /[0-9]+/, arr1)
    match($2, /[A-Z]/,  arr2)
    base = arr1[0]
    suff = arr2[0]
    if (suff in suffix) {
	mult = suffix[suff]
    }
    else {
	mult = 0
	print "Unrecognized suffix:", suffix
    }
    sum += base * mult
}
END {
    if (int(sum/suffix["G"]) > 0) {
	print int(sum/suffix["G"]) "G"
    }
    else if (int(sum/suffix["M"]) > 0) {
	print int(sum/suffix["M"]) "M"
    }
    else if (int(sum/suffix["K"]) > 0) {
	print int(sum/suffix["K"]) "K"
    }
    else {
	print sum
    }
}
