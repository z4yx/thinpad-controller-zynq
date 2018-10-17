
#ifndef _V_FRMBUF_WR_CONFIG_H_
#define _V_FRMBUF_WR_CONFIG_H_

#define SAMPLES_PER_CLOCK       1
#define MAX_COLS                2048
#define MAX_ROWS                2018
#define MAX_DATA_WIDTH          8
#define NR_COMPONENTS           3

#define BITS_PER_SAMPLE         (NR_COMPONENTS*MAX_DATA_WIDTH)
#define BITS_PER_CLOCK          (BITS_PER_SAMPLE*SAMPLES_PER_CLOCK)

#define AXIS_DATA_WIDTH         ((BITS_PER_CLOCK+7)*8/8)

#define AXIMM_DATA_WIDTH        64
#define AXIMM_NUM_OUTSTANDING   4
#define AXIMM_BURST_LENGTH      16

#define MAX_NR_PLANES           1

#define HAS_RGBX8_YUVX8         0
#define HAS_YUYV8               0
#define HAS_RGBX10_YUVX10       0
#define HAS_Y_UV8_Y_UV8_420     0
#define HAS_RGB8_YUV8           1
#define HAS_Y_UV10_Y_UV10_420   0
#define HAS_Y8                  0
#define HAS_Y10                 0
#define HAS_BGRX8               0
#define HAS_UYVY8               0

#define PLANE0_STREAM_DEPTH     256

#endif