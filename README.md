# Image Compression Benchmarks

This compression ratio tests are implemented on compressors:
- libjpeg-turbo-1.5.1
- mozjpeg-3.2
- guetzli-1.0.1
- guetzli then mozjpeg

with 2 image set:
- CMS images.
- product images.

Notes:
- libjpeg/ mozjpeg are lossless compression.
- guetzli is lossy compression with default parameters, means `butteraugli` score ~ 0.97.

## Prerequisites
- `./install.sh`
- `./do_mozjpeg_tests.sh`
- `./do_guetzli_tests.sh`
- `./guetzli_then_mozjpeg.sh`
- `./compare.sh`

## Results

### CMS images
- Artifacts: 113 images (`inputs/cms`).

| Image type           | Size    | Compare to inputs |
| -------------------- | ------- | ----------------- |
| inputs               | 4093 kB | 0%                |
| libjpeg              | 3876 kB | -5% smaller       |
| mozjpeg              | 3716 kB | -9% smaller       |
| guetzli              | 2672 kB | -34% smaller      |
| guetzli_then_mozjpeg | 2582 kB | -36% smaller      |

### Product images
- Artifacts: 493 images (`inputs/products`).

| Image type           | Size     | Compare to inputs |
| -------------------- | -------- | ----------------- |
| inputs               | 79925 kB | 0%                |
| libjpeg              | 60094 kB | -24% smaller      |
| mozjpeg              | 55325 kB | -30% smaller      |
| guetzli              | 43703 kB | -45% smaller      |
| guetzli_then_mozjpeg | 40172 kB | -49% smaller      |

## Conclutions
- `mozjpeg` is 4.13% - 8% better than `libjpeg`.
- The output of `guetzli` looks good, can't see the difference with human eyes.
- The compression time of `guetzli` is extremely slow (On a c4.2xlarge instance, guetzli compression on 493 product images takes 66 minutes).
