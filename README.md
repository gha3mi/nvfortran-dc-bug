```
export ACC_NUM_CORES=n
```

```
fpm @nv-multicore --verbose
```

```
my size is 1073741824
Initialize  :     1.030837000 [s]
Elapsed time:     0.903194000 [s]
Finalize    :     1.083766000 [s]
my size is 2147483648
Initialize  :     1.990911000 [s]
Elapsed time:     1.778218000 [s]
Finalize    :     2.114587000 [s]
my size is 3221225472
Initialize  :     3.231203000 [s]
Elapsed time:     2.702962000 [s]
Finalize    :     3.140635000 [s]
my size is 4294967296
Initialize  :     9.298128000 [s]
Elapsed time:    28.335947000 [s]
Finalize    :     6.562850000 [s]
```

```
fpm @nv-gpu --verbose
```