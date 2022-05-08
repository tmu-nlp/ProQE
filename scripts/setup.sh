#!/usr/bin/env bash

set -eu

cd `dirname $0`

data_dir=../data
mkdir -p $data_dir

echo "downloading wi+locness..."
corpus="https://www.cl.cam.ac.uk/research/nl/bea2019st/data/wi+locness_v2.1.bea19.tar.gz"
curl -L -o $data_dir/wi+locness.tar.gz $corpus
tar -zxvf $data_dir/wi+locness.tar.gz -C $data_dir

out_dir=$data_dir/tsv
mkdir -p $out_dir
echo "reconstructing dataset..."
type bspatch > /dev/null && bspatch $data_dir/wi+locness/m2/A.dev.gold.bea19.m2 $out_dir/a.tsv ../patches/patch.a.bin
type bspatch > /dev/null && bspatch $data_dir/wi+locness/m2/B.dev.gold.bea19.m2 $out_dir/b.tsv ../patches/patch.b.bin
type bspatch > /dev/null && bspatch $data_dir/wi+locness/m2/C.dev.gold.bea19.m2 $out_dir/c.tsv ../patches/patch.c.bin
type bspatch > /dev/null && bspatch $data_dir/wi+locness/m2/N.dev.gold.bea19.m2 $out_dir/n.tsv ../patches/patch.n.bin

echo "done"