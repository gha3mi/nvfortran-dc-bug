```
export ACC_NUM_CORES=n
```

```
fpm @nv-multicore --verbose
```

```
n           =           1073741824
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     1.030837000 [s]
Elapsed time:     0.903194000 [s]
Finalize    :     1.083766000 [s]

n           =           2147483648
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     1.990911000 [s]
Elapsed time:     1.778218000 [s]
Finalize    :     2.114587000 [s]

n           =           3221225472
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     3.231203000 [s]
Elapsed time:     2.702962000 [s]
Finalize    :     3.140635000 [s]

n           =           4294967296
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     9.298128000 [s]
Elapsed time:    28.335947000 [s]
Finalize    :     6.562850000 [s]
```

```
fpm @nv-gpu --verbose
```