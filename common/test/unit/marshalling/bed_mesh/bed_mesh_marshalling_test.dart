/*
 * Copyright (c) 2023. Patrick Schmidt.
 * All rights reserved.
 */

import 'dart:convert';

import 'package:common/data/dto/machine/bed_mesh/bed_mesh.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BedMesh.fromJson()', () {
    const str = '''
 {
  "profile_name": "BQ-Plate",
  "mesh_min": [
    40,
    40
  ],
  "mesh_max": [
    260,
    260
  ],
  "probed_matrix": [
    [
      -0.035,
      -0.05,
      -0.0375,
      -0.03,
      -0.0075
    ],
    [
      0.0025,
      -0.02,
      -0.0075,
      -0.005,
      -0.005
    ],
    [
      -0.005,
      -0.0325,
      0,
      -0.0075,
      0.015
    ],
    [
      -0.0025,
      -0.01,
      -0.0075,
      -0.015,
      0.02
    ],
    [
      -0.0175,
      -0.0425,
      -0.0275,
      -0.025,
      -0.0025
    ]
  ],
  "mesh_matrix": [
    [
      -0.035,
      -0.039296,
      -0.046259,
      -0.05,
      -0.04713,
      -0.04137,
      -0.0375,
      -0.035407,
      -0.032537,
      -0.03,
      -0.023611,
      -0.013556,
      -0.0075
    ],
    [
      -0.024611,
      -0.029446,
      -0.0373,
      -0.041593,
      -0.038844,
      -0.033171,
      -0.029389,
      -0.027544,
      -0.025125,
      -0.023111,
      -0.01854,
      -0.011403,
      -0.007111
    ],
    [
      -0.007556,
      -0.013295,
      -0.022642,
      -0.027852,
      -0.025251,
      -0.019632,
      -0.015944,
      -0.014531,
      -0.012906,
      -0.011778,
      -0.010147,
      -0.007723,
      -0.006278
    ],
    [
      0.0025,
      -0.003852,
      -0.014204,
      -0.02,
      -0.017278,
      -0.011333,
      -0.0075,
      -0.006444,
      -0.0055,
      -0.005,
      -0.004926,
      -0.004963,
      -0.005
    ],
    [
      0.001519,
      -0.005439,
      -0.016732,
      -0.02287,
      -0.018537,
      -0.009844,
      -0.004444,
      -0.004084,
      -0.004611,
      -0.004833,
      -0.003388,
      -0.000981,
      0.000481
    ],
    [
      -0.002463,
      -0.010231,
      -0.022769,
      -0.029296,
      -0.022371,
      -0.009292,
      -0.001389,
      -0.002118,
      -0.004947,
      -0.006222,
      -0.002082,
      0.005052,
      0.009407
    ],
    [
      -0.005,
      -0.013019,
      -0.025926,
      -0.0325,
      -0.024296,
      -0.009093,
      0,
      -0.001426,
      -0.00563,
      -0.0075,
      -0.001556,
      0.008722,
      0.015
    ],
    [
      -0.004315,
      -0.010685,
      -0.020949,
      -0.026222,
      -0.019988,
      -0.008392,
      -0.001537,
      -0.00338,
      -0.007732,
      -0.009481,
      -0.002378,
      0.00984,
      0.017296
    ],
    [
      -0.002852,
      -0.006446,
      -0.012268,
      -0.015389,
      -0.012724,
      -0.007609,
      -0.004741,
      -0.007081,
      -0.011306,
      -0.012685,
      -0.004074,
      0.010628,
      0.019593
    ],
    [
      -0.0025,
      -0.004593,
      -0.008019,
      -0.01,
      -0.009426,
      -0.008074,
      -0.0075,
      -0.01,
      -0.013944,
      -0.015,
      -0.00563,
      0.010296,
      0.02
    ],
    [
      -0.006537,
      -0.009819,
      -0.015182,
      -0.018241,
      -0.017136,
      -0.014617,
      -0.013204,
      -0.014832,
      -0.01753,
      -0.017963,
      -0.009349,
      0.005156,
      0.013981
    ],
    [
      -0.013352,
      -0.018973,
      -0.028133,
      -0.033259,
      -0.030795,
      -0.025468,
      -0.02213,
      -0.022253,
      -0.022913,
      -0.02237,
      -0.015221,
      -0.003419,
      0.003741
    ],
    [
      -0.0175,
      -0.024574,
      -0.036093,
      -0.0425,
      -0.039167,
      -0.032056,
      -0.0275,
      -0.026704,
      -0.02613,
      -0.025,
      -0.018759,
      -0.00863,
      -0.0025
    ]
  ],
  "profiles": {
    "BQ-Plate": {
      "points": [
        [
          -0.035,
          -0.05,
          -0.0375,
          -0.03,
          -0.0075
        ],
        [
          0.0025,
          -0.02,
          -0.0075,
          -0.005,
          -0.005
        ],
        [
          -0.005,
          -0.0325,
          0,
          -0.0075,
          0.015
        ],
        [
          -0.0025,
          -0.01,
          -0.0075,
          -0.015,
          0.02
        ],
        [
          -0.0175,
          -0.0425,
          -0.0275,
          -0.025,
          -0.0025
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 260,
        "min_y": 40,
        "max_y": 260,
        "x_count": 5,
        "y_count": 5,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate": {
      "points": [
        [
          -0.025,
          -0.0325,
          -0.025,
          -0.02375,
          -0.00875
        ],
        [
          0.00875,
          -0.015,
          0.0025,
          0.0025,
          0.01875
        ],
        [
          0,
          -0.0125,
          0,
          0.00375,
          0.02625
        ],
        [
          -0.005,
          -0.005,
          0.0025,
          -0.00125,
          0.01375
        ],
        [
          -0.0125,
          -0.02625,
          -0.0125,
          -0.005,
          0
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 260,
        "min_y": 40,
        "max_y": 260,
        "x_count": 5,
        "y_count": 5,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "E-Plate": {
      "points": [
        [
          -0.06,
          -0.075,
          -0.0675,
          -0.0625,
          -0.0475
        ],
        [
          -0.025,
          -0.0375,
          -0.0175,
          -0.0275,
          -0.015
        ],
        [
          -0.0175,
          -0.015,
          0,
          -0.0125,
          0.0075
        ],
        [
          -0.0125,
          -0.03,
          -0.0225,
          -0.0175,
          -0.0075
        ],
        [
          -0.04,
          -0.0325,
          -0.03,
          -0.0225,
          -0.0325
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 260,
        "min_y": 40,
        "max_y": 260,
        "x_count": 5,
        "y_count": 5,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate(Probe)": {
      "points": [
        [
          -0.07125,
          -0.045,
          -0.0275,
          -0.03,
          -0.0525
        ],
        [
          -0.0225,
          -0.0075,
          0.0125,
          0,
          -0.03375
        ],
        [
          -0.0525,
          -0.02625,
          0,
          -0.015,
          -0.03875
        ],
        [
          -0.05125,
          -0.01625,
          0,
          -0.00875,
          -0.03375
        ],
        [
          -0.06625,
          -0.0375,
          -0.0125,
          -0.0225,
          -0.06
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 260,
        "min_y": 40,
        "max_y": 260,
        "x_count": 5,
        "y_count": 5,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "BQ-Plate(Probe)": {
      "points": [
        [
          -0.07,
          -0.0525,
          -0.0225,
          -0.03375,
          -0.0625
        ],
        [
          -0.03875,
          -0.03625,
          -0.0025,
          -0.0075,
          -0.04625
        ],
        [
          -0.055,
          -0.04125,
          0,
          -0.01375,
          -0.0375
        ],
        [
          -0.06625,
          -0.0225,
          -0.005,
          -0.015,
          -0.025
        ],
        [
          -0.085,
          -0.05375,
          -0.02125,
          -0.03125,
          -0.06375
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 260,
        "min_y": 40,
        "max_y": 260,
        "x_count": 5,
        "y_count": 5,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate (Clicky)": {
      "points": [
        [
          -0.0475,
          -0.03625,
          -0.02625,
          -0.01625,
          -0.02375,
          -0.02125,
          -0.0325,
          -0.03875
        ],
        [
          -0.0175,
          -0.01,
          -0.0075,
          0,
          -0.00375,
          0,
          -0.00875,
          -0.02625
        ],
        [
          -0.005,
          0.00625,
          0.00875,
          0.01875,
          0.015,
          0.0125,
          0,
          -0.0075
        ],
        [
          -0.01125,
          -0.01,
          -0.00125,
          0.01875,
          0.00875,
          0.00875,
          -0.00125,
          -0.005
        ],
        [
          -0.01875,
          0,
          0.015,
          0.02875,
          0.01625,
          0.0175,
          0.00125,
          0.02875
        ],
        [
          -0.01875,
          -0.00125,
          0.01375,
          0.0275,
          0.01625,
          0.01375,
          -0.00125,
          -0.00375
        ],
        [
          -0.02125,
          -0.00875,
          0.00625,
          0.02125,
          0.015,
          0.0075,
          -0.01125,
          -0.01875
        ],
        [
          -0.02375,
          -0.01375,
          0,
          0.01,
          0.0125,
          0.01125,
          -0.01125,
          -0.02625
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "E-Plate (Clicky)": {
      "points": [
        [
          -0.065,
          -0.055,
          -0.035,
          -0.03,
          -0.04,
          -0.035,
          -0.03875,
          -0.0575
        ],
        [
          -0.025,
          -0.015,
          -0.00625,
          0,
          0.0025,
          -0.00125,
          -0.00625,
          -0.02875
        ],
        [
          -0.01625,
          0.00625,
          0.01125,
          0.02,
          0.02125,
          0.0025,
          -0.00625,
          -0.01625
        ],
        [
          -0.02,
          -0.02125,
          0.005,
          0.02625,
          0.0175,
          0.01375,
          -0.01,
          -0.0175
        ],
        [
          -0.02125,
          0.00625,
          0.02,
          0.0275,
          0.00125,
          0.01375,
          -0.00625,
          -0.01
        ],
        [
          -0.02375,
          -0.01,
          0.01375,
          0.025,
          0.03,
          0.015,
          -0.00125,
          -0.01125
        ],
        [
          -0.02625,
          -0.01125,
          -0.00125,
          0.0175,
          0.0175,
          0.00125,
          -0.0175,
          -0.04
        ],
        [
          -0.03875,
          -0.02,
          -0.005,
          0.00625,
          0.005,
          0.00625,
          -0.02,
          -0.0425
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "BQ-Plate (Clicky)": {
      "points": [
        [
          -0.0525,
          -0.0225,
          -0.00875,
          -0.00125,
          -0.01125,
          -0.00625,
          -0.0125,
          -0.0375
        ],
        [
          -0.03875,
          -0.01,
          -0.00125,
          0,
          0.005,
          0.01,
          -0.005,
          -0.04375
        ],
        [
          -0.0175,
          0.00125,
          0.0075,
          0.0225,
          0.0075,
          0.01375,
          -0.00125,
          -0.04125
        ],
        [
          -0.02625,
          -0.01125,
          0,
          0.02625,
          0.02625,
          0.005,
          0.0025,
          -0.0225
        ],
        [
          -0.04,
          -0.00625,
          0.02375,
          0.02125,
          0.0275,
          0.02375,
          0.0075,
          -0.0125
        ],
        [
          -0.03125,
          -0.00875,
          -0.005,
          0.0275,
          0.0225,
          0.0325,
          0.01625,
          -0.01375
        ],
        [
          -0.01625,
          -0.01875,
          -0.0025,
          0.02,
          0.0225,
          0.0175,
          0.005,
          -0.01875
        ],
        [
          -0.035,
          -0.03875,
          -0.00875,
          -0.00375,
          0.02,
          0.02125,
          -0.02625,
          -0.02625
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate (C+NG)": {
      "points": [
        [
          -0.0525,
          -0.04125,
          -0.0275,
          -0.0175,
          -0.02375,
          -0.02,
          -0.0375,
          -0.0525
        ],
        [
          -0.03875,
          -0.01875,
          -0.01125,
          0,
          0.00125,
          0,
          -0.0075,
          -0.03375
        ],
        [
          -0.03625,
          -0.01625,
          -0.01,
          0.0075,
          0.00875,
          0.00625,
          -0.0025,
          -0.02
        ],
        [
          -0.0625,
          -0.04625,
          -0.0225,
          0,
          0.00125,
          0.0025,
          -0.00875,
          -0.01125
        ],
        [
          -0.06375,
          -0.03125,
          -0.00625,
          0.00875,
          0.01,
          0.00875,
          0.00125,
          0.00125
        ],
        [
          -0.06875,
          -0.0325,
          -0.00625,
          0.00625,
          0.00375,
          0.00375,
          -0.00875,
          -0.01
        ],
        [
          -0.05875,
          -0.0325,
          -0.005,
          0.0075,
          0.00625,
          0.00125,
          -0.015,
          -0.02375
        ],
        [
          -0.04375,
          -0.02875,
          -0.00875,
          -0.00125,
          0.00375,
          0.00375,
          -0.02125,
          -0.03375
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "BQ-Plate (C+NG)": {
      "points": [
        [
          -0.04625,
          -0.02875,
          -0.00875,
          -0.0075,
          -0.02,
          -0.01625,
          -0.02375,
          -0.05875
        ],
        [
          -0.0525,
          -0.0225,
          -0.00875,
          0,
          -0.0075,
          -0.0025,
          -0.005,
          -0.05125
        ],
        [
          -0.06625,
          -0.02125,
          -0.02,
          -0.00125,
          0.00625,
          -0.005,
          -0.00625,
          -0.04
        ],
        [
          -0.08875,
          -0.06,
          -0.035,
          -0.0125,
          -0.00875,
          -0.00375,
          -0.00875,
          -0.03125
        ],
        [
          -0.0775,
          -0.03375,
          -0.0025,
          0.00375,
          -0.00875,
          0.01625,
          -0.005,
          0.0375
        ],
        [
          -0.07625,
          -0.02375,
          0,
          0.01125,
          -0.00875,
          0,
          -0.01,
          -0.00375
        ],
        [
          -0.06,
          -0.02375,
          -0.005,
          0.005,
          -0.00625,
          -0.01375,
          -0.0225,
          -0.02
        ],
        [
          -0.06125,
          -0.0525,
          -0.00875,
          -0.01125,
          -0.02125,
          -0.02375,
          -0.04375,
          -0.04375
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "E-Plate (C+NG)": {
      "points": [
        [
          -0.04875,
          -0.0325,
          -0.01875,
          -0.0175,
          -0.0275,
          -0.02375,
          -0.03125,
          -0.0575
        ],
        [
          -0.0325,
          -0.01875,
          -0.00875,
          0,
          0.00625,
          0.00375,
          -0.00625,
          -0.025
        ],
        [
          -0.0325,
          -0.01,
          -0.00125,
          0.01375,
          0.02125,
          0.0075,
          -0.0025,
          -0.01625
        ],
        [
          -0.05,
          -0.045,
          -0.015,
          0.01375,
          0.01125,
          0.015,
          -0.00875,
          -0.01875
        ],
        [
          -0.05125,
          -0.01375,
          0.00875,
          0.0175,
          0.00875,
          0.015,
          0.0075,
          0.00625
        ],
        [
          -0.05625,
          -0.02125,
          -0.005,
          0.015,
          0.025,
          0.01875,
          0.0075,
          -0.0025
        ],
        [
          -0.05,
          -0.02125,
          -0.01125,
          0.01125,
          0.015,
          0.00625,
          -0.015,
          -0.02875
        ],
        [
          -0.045,
          -0.02125,
          -0.00875,
          0.0025,
          0.0025,
          0.01,
          -0.0175,
          -0.035
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate (C+NG+B)": {
      "points": [
        [
          -0.07875,
          -0.05875,
          -0.0475,
          -0.02375,
          -0.03,
          -0.03,
          -0.04375,
          -0.0575
        ],
        [
          -0.035,
          -0.02875,
          -0.01875,
          0,
          0.005,
          0.0025,
          -0.00875,
          -0.03625
        ],
        [
          -0.04125,
          -0.02875,
          -0.02125,
          -0.00125,
          0.00375,
          0.00875,
          -0.01625,
          -0.0325
        ],
        [
          -0.06,
          -0.05375,
          -0.03125,
          -0.005,
          -0.00625,
          0,
          -0.00875,
          -0.0175
        ],
        [
          -0.05625,
          -0.03875,
          -0.02,
          0.01125,
          0.00125,
          0.005,
          0,
          -0.00875
        ],
        [
          -0.065,
          -0.04,
          -0.01375,
          0.0025,
          0.00125,
          0.005,
          -0.01,
          -0.01375
        ],
        [
          -0.06375,
          -0.03625,
          -0.0225,
          -0.00125,
          0,
          -0.0075,
          -0.02125,
          -0.0325
        ],
        [
          -0.05875,
          -0.045,
          -0.03,
          -0.00875,
          -0.005,
          -0.00875,
          -0.03375,
          -0.0425
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "E-Plate (C+NG+B)": {
      "points": [
        [
          -0.1125,
          -0.075,
          -0.0475,
          -0.0375,
          -0.06125,
          -0.055,
          -0.0475,
          -0.09375
        ],
        [
          -0.07125,
          -0.03625,
          -0.0125,
          0,
          -0.01625,
          -0.01875,
          -0.01125,
          -0.04875
        ],
        [
          -0.06625,
          -0.01875,
          -0.00375,
          0.0075,
          0.005,
          -0.005,
          0.0025,
          -0.04
        ],
        [
          -0.08125,
          -0.055,
          -0.01375,
          0.01375,
          0,
          -0.00375,
          0,
          -0.03125
        ],
        [
          -0.0875,
          -0.04,
          -0.00125,
          0.00875,
          0.005,
          0.00375,
          0.01125,
          -0.01
        ],
        [
          -0.09,
          -0.04875,
          -0.01125,
          0.0075,
          0.005,
          -0.00625,
          0,
          -0.0275
        ],
        [
          -0.0875,
          -0.04625,
          -0.0275,
          -0.01,
          -0.01625,
          -0.02375,
          -0.0225,
          -0.0575
        ],
        [
          -0.105,
          -0.0675,
          -0.04625,
          -0.03,
          -0.04375,
          -0.045,
          -0.0475,
          -0.08875
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "BQ-Plate (C+NG+B)": {
      "points": [
        [
          -0.09625,
          -0.055,
          -0.035,
          -0.02625,
          -0.03625,
          -0.0375,
          -0.04875,
          -0.06625
        ],
        [
          -0.055,
          -0.015,
          -0.01125,
          0,
          -0.00125,
          -0.00625,
          -0.00875,
          -0.04125
        ],
        [
          -0.04625,
          -0.01125,
          -0.00625,
          0.01,
          0.0075,
          0.00375,
          -0.00375,
          -0.03
        ],
        [
          -0.075,
          -0.03375,
          -0.0125,
          0.00875,
          0.0125,
          -0.0025,
          0.00125,
          -0.02
        ],
        [
          -0.08,
          -0.0375,
          -0.00625,
          0.01125,
          0.01625,
          0.01125,
          0.0075,
          -0.00375
        ],
        [
          -0.085,
          -0.03625,
          -0.0175,
          -0.00125,
          -0.0025,
          -0.00125,
          -0.00375,
          -0.01625
        ],
        [
          -0.08125,
          -0.04125,
          -0.03,
          -0.00375,
          -0.00625,
          -0.02,
          -0.015,
          -0.035
        ],
        [
          -0.07875,
          -0.06375,
          -0.05,
          -0.02625,
          -0.02125,
          -0.02375,
          -0.0475,
          -0.05875
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "BQ_V2": {
      "points": [
        [
          -0.04,
          -0.03375,
          -0.03125,
          -0.015,
          -0.025,
          -0.02375,
          -0.02875,
          -0.04375
        ],
        [
          -0.02375,
          -0.01875,
          -0.01625,
          0,
          0.005,
          0.00875,
          0.005,
          -0.035
        ],
        [
          -0.0375,
          -0.015,
          -0.01,
          0.0125,
          0.02,
          0.015,
          0.01125,
          -0.01625
        ],
        [
          -0.04375,
          -0.02875,
          -0.0175,
          0.0175,
          0.035,
          0.02125,
          0.03125,
          0.005
        ],
        [
          -0.04125,
          -0.00125,
          0.005,
          0.0375,
          0.035,
          0.0425,
          0.04625,
          0.0425
        ],
        [
          -0.03375,
          0.00375,
          0.00875,
          0.035,
          0.0375,
          0.035,
          0.035,
          0.02375
        ],
        [
          -0.015,
          0.005,
          0.01625,
          0.03375,
          0.035,
          0.025,
          0.02875,
          0.01125
        ],
        [
          -0.015,
          -0.0025,
          0.01625,
          0.035,
          0.03875,
          0.03875,
          0.0225,
          0.00875
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "VW-Plate (C+NG+B++)": {
      "points": [
        [
          -0.0725,
          -0.06375,
          -0.0525,
          -0.03625,
          -0.04125,
          -0.04125,
          -0.05625,
          -0.06375
        ],
        [
          -0.0325,
          -0.02125,
          -0.0225,
          0,
          0,
          0.00125,
          -0.01625,
          -0.04
        ],
        [
          -0.04,
          -0.025,
          -0.01875,
          0.00375,
          0.00375,
          0.015,
          -0.005,
          -0.02125
        ],
        [
          -0.05875,
          -0.045,
          -0.0225,
          0.00375,
          0.0075,
          0.0075,
          0.00375,
          -0.0075
        ],
        [
          -0.0575,
          -0.03875,
          -0.015,
          0.01125,
          0.0075,
          0.0125,
          0.005,
          -0.00375
        ],
        [
          -0.06375,
          -0.03625,
          -0.01375,
          0.005,
          0.0025,
          0.0075,
          -0.0075,
          -0.01125
        ],
        [
          -0.06875,
          -0.0425,
          -0.03125,
          -0.01125,
          -0.0075,
          -0.02125,
          -0.0325,
          -0.045
        ],
        [
          -0.075,
          -0.0575,
          -0.04875,
          -0.03,
          -0.03125,
          -0.03625,
          -0.05625,
          -0.06875
        ]
      ],
      "mesh_params": {
        "min_x": 40,
        "max_x": 259.94,
        "min_y": 40,
        "max_y": 259.94,
        "x_count": 8,
        "y_count": 8,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "Bed_45_left_rotated_try2_10min_heat": {
      "points": [
        [
          0.04125,
          0.08875,
          0.1175,
          0.1125,
          0.0825,
          -0.02625
        ],
        [
          0.01375,
          0.06625,
          0.0975,
          0.0925,
          0.0675,
          -0.0225
        ],
        [
          -0.0325,
          0.0275,
          0.065,
          0.0625,
          0.02875,
          -0.0425
        ],
        [
          -0.04,
          0.0175,
          0.0525,
          0.07125,
          0.05125,
          -0.01375
        ],
        [
          0.0025,
          0.055,
          0.095,
          0.1,
          0.0725,
          0.01
        ],
        [
          0.055,
          0.1025,
          0.13125,
          0.12125,
          0.085,
          0.02875
        ]
      ],
      "mesh_params": {
        "min_x": 25,
        "max_x": 275,
        "min_y": 25,
        "max_y": 275,
        "x_count": 6,
        "y_count": 6,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "Bed_45_left_rotated_try1_5min_heated": {
      "points": [
        [
          0.05375,
          0.09875,
          0.12625,
          0.12,
          0.0925,
          -0.01875
        ],
        [
          0.025,
          0.07875,
          0.10375,
          0.0975,
          0.075,
          -0.01875
        ],
        [
          -0.02375,
          0.035,
          0.075,
          0.0725,
          0.045,
          -0.02875
        ],
        [
          -0.02875,
          0.02625,
          0.06375,
          0.08375,
          0.0625,
          0.005
        ],
        [
          0.0125,
          0.0625,
          0.10625,
          0.115,
          0.09,
          0.0275
        ],
        [
          0.065,
          0.115,
          0.14125,
          0.13125,
          0.0975,
          0.0475
        ]
      ],
      "mesh_params": {
        "min_x": 25,
        "max_x": 275,
        "min_y": 25,
        "max_y": 275,
        "x_count": 6,
        "y_count": 6,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    },
    "Bed_45_left_rotated_try3_roomtemp": {
      "points": [
        [
          0.0325,
          0.08375,
          0.1125,
          0.105,
          0.075,
          -0.04
        ],
        [
          0.00625,
          0.06125,
          0.0875,
          0.07625,
          0.06,
          -0.035
        ],
        [
          -0.0425,
          0.01625,
          0.05,
          0.0475,
          0.02,
          -0.0475
        ],
        [
          -0.04875,
          0.0075,
          0.04375,
          0.0625,
          0.04,
          -0.02
        ],
        [
          -0.005,
          0.0425,
          0.0825,
          0.09,
          0.0675,
          0.0025
        ],
        [
          0.0525,
          0.1,
          0.1275,
          0.115,
          0.07625,
          0.0275
        ]
      ],
      "mesh_params": {
        "min_x": 25,
        "max_x": 275,
        "min_y": 25,
        "max_y": 275,
        "x_count": 6,
        "y_count": 6,
        "mesh_x_pps": 2,
        "mesh_y_pps": 2,
        "algo": "bicubic",
        "tension": 0.2
      }
    }
  }
}
    ''';
    var strToJson = jsonDecode(str);

    var mesh = BedMesh.fromJson(strToJson);

    expect(mesh.profileName, 'BQ-Plate');
    expect(mesh.probedMatrix.length, 5);
    expect(mesh.probedMatrix.fold(0, (previousValue, element) => previousValue + element.length), 5 * 5);
    expect(mesh.meshMatrix.fold(0, (previousValue, element) => previousValue + element.length), 13 * 13);
    expect(mesh.profiles.length, 19);
  });
}
