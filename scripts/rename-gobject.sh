#!/bin/bash

function usage
{
	echo
	echo "Usage: $0 old_namespace old_name old_type new_namespace new_name new_type file"
	echo
	echo "Example:"
	echo "	$0 GSC PROPOSAL_OLD GscProposalOld SC PLUGIN_NEW ScPluginNew gsc-proposal-old.h"
	echo
}

if [ $# -ne 7 ]
then
	usage $*
	exit 1
fi

orig_ns=$1
orig_name=$2
orig_type=$3

new_ns=$4
new_name=$5
new_type=$6


orig_mays=${orig_ns}_${orig_name}
orig_mays=$(echo $orig_mays | tr '[:lower:]' '[:upper:]')
orig_min=$(echo $orig_mays | tr '[:upper:]' '[:lower:]')
orig_file=$(echo $orig_min | tr '_' '-')
orig_file2=$(echo $orig_min | tr -d '_')
orig_is=${orig_ns}_IS_${orig_name}
orig_is=$(echo $orig_is | tr '[:lower:]' '[:upper:]')
orig_ptype=${orig_ns}_TYPE_${orig_name}
orig_ptype=$(echo $orig_ptype | tr '[:lower:]' '[:upper:]')

new_mays=${new_ns}_${new_name}
new_mays=$(echo $new_mays | tr '[:lower:]' '[:upper:]')
new_min=$(echo $new_mays | tr '[:upper:]' '[:lower:]')
new_file=$(echo $new_min | tr '_' '-')
new_file2=$(echo $new_min | tr -d '_')
new_is=${new_ns}_IS_${new_name}
new_is=$(echo $new_is | tr '[:lower:]' '[:upper:]')
new_ptype=${new_ns}_TYPE_${new_name}
new_ptype=$(echo $new_ptype | tr '[:lower:]' '[:upper:]')

echo "----------"
echo -e "$orig_type \t $new_type"
echo -e "$orig_mays \t $new_mays"
echo -e "$orig_min \t $new_min"
echo -e "$orig_file \t $new_file"
echo -e "$orig_file2 \t $new_file2"
echo -e "$orig_is \t $new_is"
echo -e "$orig_ptype \t $new_ptype"
echo "----------"


com="s/${orig_is}/${new_is}/g;s/${orig_ptype}/${new_ptype}/g"
com="$com;s/$orig_mays/$new_mays/g;s/$orig_ns/$new_ns/g;s/$orig_type/$new_type/g"
com="$com;s/$orig_min/$new_min/g;s/${orig_file}/${new_file}/g"
com="$com;s/__${orig_mays}_H__/__${new_mays}_H__/g;s/__${orig_name}_H__/__${new_name}_H__/g"
com="$com;s/${orig_file2}/${new_file2}/g"

com="sed -i $com"

$com $7
