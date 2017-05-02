# Image Compression Benchmarks

## Test 1: libjpeg-turbo-1.5.1 vs mozjpeg-3.2

In this section, we will test compression ratio between `libjpeb` vs `mozjpeg` on their latest versions,
with 2 image set:
- CMS images.
- product images.

### Prerequisites
- `./install.sh`
- `./do_mozjpeg_tests.sh`

### Results

#### CMS images
inputs 4093 kB 113 files
libjpeg 3876 kB 113 files
mozjpeg 3716 kB 113 files -4% smaller

#### Product images
inputs 79925 kB 493 files
libjpeg 60094 kB 493 files
mozjpeg 55325 kB 493 files -7% smaller
