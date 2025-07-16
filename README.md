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
Initialize  :     1.064724000 [s]
Elapsed time:     0.947305000 [s]
Finalize    :     1.265888000 [s]

n           =           2147483648
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     2.124329000 [s]
Elapsed time:     2.014653000 [s]
Finalize    :     2.347173000 [s]

n           =           3221225472
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     3.274863000 [s]
Elapsed time:     2.804645000 [s]
Finalize    :     3.312508000 [s]

n           =           4294967296
chunk       =           2147483647
huge(int32) =           2147483647
huge(int64) =  9223372036854775807
Initialize  :     7.620918000 [s]
Elapsed time:    25.498055000 [s]
Finalize    :     6.859171000 [s]
```

```
fpm @nv-gpu --verbose
```