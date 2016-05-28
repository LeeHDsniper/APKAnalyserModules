.class public Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;
.super Ljava/lang/Object;
.source "ImageProcessorHelper.java"


# direct methods
.method private static findConstants([D[D[D[D[D[DD)V
    .registers 48
    .param p0, "n_p"    # [D
    .param p1, "n_m"    # [D
    .param p2, "d_p"    # [D
    .param p3, "d_m"    # [D
    .param p4, "bd_p"    # [D
    .param p5, "bd_m"    # [D
    .param p6, "std_dev"    # D

    .prologue
    .line 139
    const-wide v30, 0x401921fb82c2bd7fL

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v30

    mul-double v4, v30, p6

    .line 140
    .local v4, "div":D
    const-wide v30, -0x400378d4fdf3b646L

    div-double v14, v30, p6

    .line 141
    .local v14, "x0":D
    const-wide v30, -0x40046e978d4fdf3bL

    div-double v16, v30, p6

    .line 142
    .local v16, "x1":D
    const-wide v30, 0x3fe437b4a2339c0fL

    div-double v18, v30, p6

    .line 143
    .local v18, "x2":D
    const-wide v30, 0x3ffff3b645a1cac1L

    div-double v20, v30, p6

    .line 144
    .local v20, "x3":D
    const-wide v30, 0x3ffae28240b78034L

    div-double v22, v30, v4

    .line 145
    .local v22, "x4":D
    const-wide v30, 0x400de147ae147ae1L

    div-double v24, v30, v4

    .line 146
    .local v24, "x5":D
    const-wide v30, -0x401a3afb7e90ff97L

    div-double v26, v30, v4

    .line 147
    .local v26, "x6":D
    const-wide v30, -0x402f5f6fd21ff2e5L

    div-double v28, v30, v4

    .line 150
    .local v28, "x7":D
    const/4 v7, 0x0

    add-double v30, v22, v26

    aput-wide v30, p0, v7

    .line 151
    const/4 v7, 0x1

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->exp(D)D

    move-result-wide v30

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->sin(D)D

    move-result-wide v32

    mul-double v32, v32, v28

    const-wide/high16 v34, 0x4000000000000000L

    mul-double v34, v34, v22

    add-double v34, v34, v26

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v36

    mul-double v34, v34, v36

    sub-double v32, v32, v34

    mul-double v30, v30, v32

    invoke-static {v14, v15}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v34

    mul-double v34, v34, v24

    const-wide/high16 v36, 0x4000000000000000L

    mul-double v36, v36, v26

    add-double v36, v36, v22

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v38

    mul-double v36, v36, v38

    sub-double v34, v34, v36

    mul-double v32, v32, v34

    add-double v30, v30, v32

    aput-wide v30, p0, v7

    .line 153
    const/4 v7, 0x2

    const-wide/high16 v30, 0x4000000000000000L

    add-double v32, v14, v16

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    add-double v32, v22, v26

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v34, v34, v24

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v36

    mul-double v34, v34, v36

    sub-double v32, v32, v34

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v34, v34, v28

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->sin(D)D

    move-result-wide v36

    mul-double v34, v34, v36

    sub-double v32, v32, v34

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v14

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v32, v32, v26

    add-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v16

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v32, v32, v22

    add-double v30, v30, v32

    aput-wide v30, p0, v7

    .line 157
    const/4 v7, 0x3

    const-wide/high16 v30, 0x4000000000000000L

    mul-double v30, v30, v14

    add-double v30, v30, v16

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->exp(D)D

    move-result-wide v30

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->sin(D)D

    move-result-wide v32

    mul-double v32, v32, v28

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v34, v34, v26

    sub-double v32, v32, v34

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v16

    add-double v32, v32, v14

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v34

    mul-double v34, v34, v24

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v36

    mul-double v36, v36, v22

    sub-double v34, v34, v36

    mul-double v32, v32, v34

    add-double v30, v30, v32

    aput-wide v30, p0, v7

    .line 159
    const/4 v7, 0x4

    const-wide/16 v30, 0x0

    aput-wide v30, p0, v7

    .line 161
    const/4 v7, 0x0

    const-wide/16 v30, 0x0

    aput-wide v30, p2, v7

    .line 162
    const/4 v7, 0x1

    const-wide/high16 v30, -0x4000000000000000L

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    invoke-static {v14, v15}, Ljava/lang/Math;->exp(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    sub-double v30, v30, v32

    aput-wide v30, p2, v7

    .line 163
    const/4 v7, 0x2

    const-wide/high16 v30, 0x4010000000000000L

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    add-double v32, v14, v16

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v16

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    add-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v14

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    add-double v30, v30, v32

    aput-wide v30, p2, v7

    .line 164
    const/4 v7, 0x3

    const-wide/high16 v30, -0x4000000000000000L

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v16

    add-double v32, v32, v14

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->exp(D)D

    move-result-wide v32

    mul-double v30, v30, v32

    const-wide/high16 v32, 0x4000000000000000L

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    const-wide/high16 v34, 0x4000000000000000L

    mul-double v34, v34, v14

    add-double v34, v34, v16

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->exp(D)D

    move-result-wide v34

    mul-double v32, v32, v34

    sub-double v30, v30, v32

    aput-wide v30, p2, v7

    .line 165
    const/4 v7, 0x4

    const-wide/high16 v30, 0x4000000000000000L

    mul-double v30, v30, v14

    const-wide/high16 v32, 0x4000000000000000L

    mul-double v32, v32, v16

    add-double v30, v30, v32

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->exp(D)D

    move-result-wide v30

    aput-wide v30, p2, v7

    .line 167
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1a2
    const/4 v7, 0x4

    if-gt v6, v7, :cond_1ac

    .line 168
    aget-wide v30, p2, v6

    aput-wide v30, p3, v6

    .line 167
    add-int/lit8 v6, v6, 0x1

    goto :goto_1a2

    .line 171
    :cond_1ac
    const/4 v7, 0x0

    const-wide/16 v30, 0x0

    aput-wide v30, p1, v7

    .line 172
    const/4 v6, 0x1

    :goto_1b2
    const/4 v7, 0x4

    if-gt v6, v7, :cond_1c5

    .line 173
    aget-wide v30, p0, v6

    aget-wide v32, p2, v6

    const/4 v7, 0x0

    aget-wide v34, p0, v7

    mul-double v32, v32, v34

    sub-double v30, v30, v32

    aput-wide v30, p1, v6

    .line 172
    add-int/lit8 v6, v6, 0x1

    goto :goto_1b2

    .line 179
    :cond_1c5
    const-wide/16 v12, 0x0

    .line 180
    .local v12, "sum_n_p":D
    const-wide/16 v10, 0x0

    .line 181
    .local v10, "sum_n_m":D
    const-wide/16 v8, 0x0

    .line 183
    .local v8, "sum_d":D
    const/4 v6, 0x0

    :goto_1cc
    const/4 v7, 0x4

    if-gt v6, v7, :cond_1de

    .line 184
    aget-wide v30, p0, v6

    add-double v12, v12, v30

    .line 185
    aget-wide v30, p1, v6

    add-double v10, v10, v30

    .line 186
    aget-wide v30, p2, v6

    add-double v8, v8, v30

    .line 183
    add-int/lit8 v6, v6, 0x1

    goto :goto_1cc

    .line 189
    :cond_1de
    const-wide/high16 v30, 0x3ff0000000000000L

    add-double v30, v30, v8

    div-double v0, v12, v30

    .line 190
    .local v0, "a":D
    const-wide/high16 v30, 0x3ff0000000000000L

    add-double v30, v30, v8

    div-double v2, v10, v30

    .line 192
    .local v2, "b":D
    const/4 v6, 0x0

    :goto_1eb
    const/4 v7, 0x4

    if-gt v6, v7, :cond_1fd

    .line 193
    aget-wide v30, p2, v6

    mul-double v30, v30, v0

    aput-wide v30, p4, v6

    .line 194
    aget-wide v30, p3, v6

    mul-double v30, v30, v2

    aput-wide v30, p5, v6

    .line 192
    add-int/lit8 v6, v6, 0x1

    goto :goto_1eb

    .line 196
    :cond_1fd
    return-void
.end method

.method public static gaussGray([IDDII)I
    .registers 48
    .param p0, "psrc"    # [I
    .param p1, "horz"    # D
    .param p3, "vert"    # D
    .param p5, "width"    # I
    .param p6, "height"    # I

    .prologue
    .line 13
    move/from16 v21, p5

    .line 14
    .local v21, "row_stride":I
    invoke-static/range {p5 .. p6}, Ljava/lang/Math;->max(II)I

    move-result v19

    .line 17
    .local v19, "max_len":I
    move/from16 v0, v19

    new-array v0, v0, [D

    move-object/from16 v28, v0

    .line 18
    .local v28, "val_p":[D
    move/from16 v0, v19

    new-array v0, v0, [D

    move-object/from16 v27, v0

    .line 20
    .local v27, "val_m":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v4, v0, [D

    .line 21
    .local v4, "n_p":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v5, v0, [D

    .line 22
    .local v5, "n_m":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v6, v0, [D

    .line 23
    .local v6, "d_p":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v7, v0, [D

    .line 24
    .local v7, "d_m":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v8, v0, [D

    .line 25
    .local v8, "bd_p":[D
    const/16 v31, 0x5

    move/from16 v0, v31

    new-array v9, v0, [D

    .line 27
    .local v9, "bd_m":[D
    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v24, v0

    .line 28
    .local v24, "src":[I
    move/from16 v0, v19

    new-array v13, v0, [I

    .line 30
    .local v13, "dst":[I
    const/16 v31, 0x4

    move/from16 v0, v31

    new-array v0, v0, [I

    move-object/from16 v16, v0

    .line 31
    .local v16, "initial_p":[I
    const/16 v31, 0x4

    move/from16 v0, v31

    new-array v15, v0, [I

    .line 33
    .local v15, "initial_m":[I
    const-wide/16 v32, 0x0

    cmpl-double v31, p3, v32

    if-lez v31, :cond_17c

    .line 34
    invoke-static/range {p3 .. p4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v32

    const-wide/high16 v34, 0x3ff0000000000000L

    add-double p3, v32, v34

    .line 35
    mul-double v32, p3, p3

    move-wide/from16 v0, v32

    neg-double v0, v0

    move-wide/from16 v32, v0

    const-wide/high16 v34, 0x4000000000000000L

    const-wide v36, 0x3f70101010101010L

    invoke-static/range {v36 .. v37}, Ljava/lang/Math;->log(D)D

    move-result-wide v36

    mul-double v34, v34, v36

    div-double v32, v32, v34

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    .line 37
    .local v10, "std_dev":D
    invoke-static/range {v4 .. v11}, Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;->findConstants([D[D[D[D[D[DD)V

    .line 39
    const/4 v12, 0x0

    .local v12, "col":I
    :goto_7a
    move/from16 v0, p5

    if-ge v12, v0, :cond_17c

    .line 40
    const/16 v18, 0x0

    .local v18, "k":I
    :goto_80
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_8f

    .line 41
    const-wide/16 v32, 0x0

    aput-wide v32, v28, v18

    aput-wide v32, v27, v18

    .line 40
    add-int/lit8 v18, v18, 0x1

    goto :goto_80

    .line 44
    :cond_8f
    const/16 v25, 0x0

    .local v25, "t":I
    :goto_91
    move/from16 v0, v25

    move/from16 v1, p6

    if-ge v0, v1, :cond_a2

    .line 45
    mul-int v31, v25, v21

    add-int v31, v31, v12

    aget v31, p0, v31

    aput v31, v24, v25

    .line 44
    add-int/lit8 v25, v25, 0x1

    goto :goto_91

    .line 48
    :cond_a2
    const/16 v23, 0x0

    .line 49
    .local v23, "sp_p_idx":I
    add-int/lit8 v22, p6, -0x1

    .line 50
    .local v22, "sp_m_idx":I
    const/16 v30, 0x0

    .line 51
    .local v30, "vp_idx":I
    add-int/lit8 v29, p6, -0x1

    .line 53
    .local v29, "vm_idx":I
    const/16 v31, 0x0

    const/16 v32, 0x0

    aget v32, v24, v32

    aput v32, v16, v31

    .line 54
    const/16 v31, 0x0

    add-int/lit8 v32, p6, -0x1

    aget v32, v24, v32

    aput v32, v15, v31

    .line 56
    const/16 v20, 0x0

    .local v20, "row":I
    :goto_bc
    move/from16 v0, v20

    move/from16 v1, p6

    if-ge v0, v1, :cond_158

    .line 57
    const/16 v31, 0x4

    move/from16 v0, v20

    move/from16 v1, v31

    if-ge v0, v1, :cond_10e

    move/from16 v26, v20

    .line 59
    .local v26, "terms":I
    :goto_cc
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_cd
    move/from16 v0, v26

    if-gt v14, v0, :cond_111

    .line 60
    aget-wide v32, v28, v30

    aget-wide v34, v4, v14

    sub-int v31, v23, v14

    aget v31, v24, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    aget-wide v36, v6, v14

    sub-int v31, v30, v14

    aget-wide v38, v28, v31

    mul-double v36, v36, v38

    sub-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v28, v30

    .line 61
    aget-wide v32, v27, v29

    aget-wide v34, v5, v14

    add-int v31, v22, v14

    aget v31, v24, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    aget-wide v36, v7, v14

    add-int v31, v29, v14

    aget-wide v38, v27, v31

    mul-double v36, v36, v38

    sub-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v27, v29

    .line 59
    add-int/lit8 v14, v14, 0x1

    goto :goto_cd

    .line 57
    .end local v14    # "i":I
    .end local v26    # "terms":I
    :cond_10e
    const/16 v26, 0x4

    goto :goto_cc

    .line 63
    .restart local v14    # "i":I
    .restart local v26    # "terms":I
    :cond_111
    move/from16 v17, v14

    .local v17, "j":I
    :goto_113
    const/16 v31, 0x4

    move/from16 v0, v17

    move/from16 v1, v31

    if-gt v0, v1, :cond_14c

    .line 64
    aget-wide v32, v28, v30

    aget-wide v34, v4, v17

    aget-wide v36, v8, v17

    sub-double v34, v34, v36

    const/16 v31, 0x0

    aget v31, v16, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v28, v30

    .line 65
    aget-wide v32, v27, v29

    aget-wide v34, v5, v17

    aget-wide v36, v9, v17

    sub-double v34, v34, v36

    const/16 v31, 0x0

    aget v31, v15, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v27, v29

    .line 63
    add-int/lit8 v17, v17, 0x1

    goto :goto_113

    .line 68
    :cond_14c
    add-int/lit8 v23, v23, 0x1

    .line 69
    add-int/lit8 v22, v22, -0x1

    .line 70
    add-int/lit8 v30, v30, 0x1

    .line 71
    add-int/lit8 v29, v29, -0x1

    .line 56
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_bc

    .line 74
    .end local v14    # "i":I
    .end local v17    # "j":I
    .end local v26    # "terms":I
    :cond_158
    const/16 v31, 0x1

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move/from16 v2, v31

    move/from16 v3, p6

    invoke-static {v0, v1, v13, v2, v3}, Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;->transferGaussPixels([D[D[III)V

    .line 76
    const/16 v25, 0x0

    :goto_167
    move/from16 v0, v25

    move/from16 v1, p6

    if-ge v0, v1, :cond_178

    .line 77
    mul-int v31, v25, v21

    add-int v31, v31, v12

    aget v32, v13, v25

    aput v32, p0, v31

    .line 76
    add-int/lit8 v25, v25, 0x1

    goto :goto_167

    .line 39
    :cond_178
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_7a

    .line 82
    .end local v10    # "std_dev":D
    .end local v12    # "col":I
    .end local v18    # "k":I
    .end local v20    # "row":I
    .end local v22    # "sp_m_idx":I
    .end local v23    # "sp_p_idx":I
    .end local v25    # "t":I
    .end local v29    # "vm_idx":I
    .end local v30    # "vp_idx":I
    :cond_17c
    const-wide/16 v32, 0x0

    cmpl-double v31, p1, v32

    if-lez v31, :cond_2ac

    .line 83
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v32

    const-wide/high16 v34, 0x3ff0000000000000L

    add-double p1, v32, v34

    .line 85
    cmpl-double v31, p1, p3

    if-eqz v31, :cond_1ab

    .line 86
    mul-double v32, p1, p1

    move-wide/from16 v0, v32

    neg-double v0, v0

    move-wide/from16 v32, v0

    const-wide/high16 v34, 0x4000000000000000L

    const-wide v36, 0x3f70101010101010L

    invoke-static/range {v36 .. v37}, Ljava/lang/Math;->log(D)D

    move-result-wide v36

    mul-double v34, v34, v36

    div-double v32, v32, v34

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    .line 88
    .restart local v10    # "std_dev":D
    invoke-static/range {v4 .. v11}, Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;->findConstants([D[D[D[D[D[DD)V

    .line 91
    .end local v10    # "std_dev":D
    :cond_1ab
    const/16 v20, 0x0

    .restart local v20    # "row":I
    :goto_1ad
    move/from16 v0, v20

    move/from16 v1, p6

    if-ge v0, v1, :cond_2ac

    .line 92
    const/16 v18, 0x0

    .restart local v18    # "k":I
    :goto_1b5
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_1c4

    .line 93
    const-wide/16 v32, 0x0

    aput-wide v32, v28, v18

    aput-wide v32, v27, v18

    .line 92
    add-int/lit8 v18, v18, 0x1

    goto :goto_1b5

    .line 96
    :cond_1c4
    const/16 v25, 0x0

    .restart local v25    # "t":I
    :goto_1c6
    move/from16 v0, v25

    move/from16 v1, p5

    if-ge v0, v1, :cond_1d7

    .line 97
    mul-int v31, v20, v21

    add-int v31, v31, v25

    aget v31, p0, v31

    aput v31, v24, v25

    .line 96
    add-int/lit8 v25, v25, 0x1

    goto :goto_1c6

    .line 100
    :cond_1d7
    const/16 v23, 0x0

    .line 101
    .restart local v23    # "sp_p_idx":I
    add-int/lit8 v22, p5, -0x1

    .line 102
    .restart local v22    # "sp_m_idx":I
    const/16 v30, 0x0

    .line 103
    .restart local v30    # "vp_idx":I
    add-int/lit8 v29, p5, -0x1

    .line 105
    .restart local v29    # "vm_idx":I
    const/16 v31, 0x0

    const/16 v32, 0x0

    aget v32, v24, v32

    aput v32, v16, v31

    .line 106
    const/16 v31, 0x0

    add-int/lit8 v32, p5, -0x1

    aget v32, v24, v32

    aput v32, v15, v31

    .line 108
    const/4 v12, 0x0

    .restart local v12    # "col":I
    :goto_1f0
    move/from16 v0, p5

    if-ge v12, v0, :cond_288

    .line 109
    const/16 v31, 0x4

    move/from16 v0, v31

    if-ge v12, v0, :cond_23e

    move/from16 v26, v12

    .line 111
    .restart local v26    # "terms":I
    :goto_1fc
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_1fd
    move/from16 v0, v26

    if-gt v14, v0, :cond_241

    .line 112
    aget-wide v32, v28, v30

    aget-wide v34, v4, v14

    sub-int v31, v23, v14

    aget v31, v24, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    aget-wide v36, v6, v14

    sub-int v31, v30, v14

    aget-wide v38, v28, v31

    mul-double v36, v36, v38

    sub-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v28, v30

    .line 113
    aget-wide v32, v27, v29

    aget-wide v34, v5, v14

    add-int v31, v22, v14

    aget v31, v24, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    aget-wide v36, v7, v14

    add-int v31, v29, v14

    aget-wide v38, v27, v31

    mul-double v36, v36, v38

    sub-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v27, v29

    .line 111
    add-int/lit8 v14, v14, 0x1

    goto :goto_1fd

    .line 109
    .end local v14    # "i":I
    .end local v26    # "terms":I
    :cond_23e
    const/16 v26, 0x4

    goto :goto_1fc

    .line 115
    .restart local v14    # "i":I
    .restart local v26    # "terms":I
    :cond_241
    move/from16 v17, v14

    .restart local v17    # "j":I
    :goto_243
    const/16 v31, 0x4

    move/from16 v0, v17

    move/from16 v1, v31

    if-gt v0, v1, :cond_27c

    .line 116
    aget-wide v32, v28, v30

    aget-wide v34, v4, v17

    aget-wide v36, v8, v17

    sub-double v34, v34, v36

    const/16 v31, 0x0

    aget v31, v16, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v28, v30

    .line 117
    aget-wide v32, v27, v29

    aget-wide v34, v5, v17

    aget-wide v36, v9, v17

    sub-double v34, v34, v36

    const/16 v31, 0x0

    aget v31, v15, v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    add-double v32, v32, v34

    aput-wide v32, v27, v29

    .line 115
    add-int/lit8 v17, v17, 0x1

    goto :goto_243

    .line 120
    :cond_27c
    add-int/lit8 v23, v23, 0x1

    .line 121
    add-int/lit8 v22, v22, -0x1

    .line 122
    add-int/lit8 v30, v30, 0x1

    .line 123
    add-int/lit8 v29, v29, -0x1

    .line 108
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_1f0

    .line 126
    .end local v14    # "i":I
    .end local v17    # "j":I
    .end local v26    # "terms":I
    :cond_288
    const/16 v31, 0x1

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move/from16 v2, v31

    move/from16 v3, p5

    invoke-static {v0, v1, v13, v2, v3}, Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;->transferGaussPixels([D[D[III)V

    .line 128
    const/16 v25, 0x0

    :goto_297
    move/from16 v0, v25

    move/from16 v1, p5

    if-ge v0, v1, :cond_2a8

    .line 129
    mul-int v31, v20, v21

    add-int v31, v31, v25

    aget v32, v13, v25

    aput v32, p0, v31

    .line 128
    add-int/lit8 v25, v25, 0x1

    goto :goto_297

    .line 91
    :cond_2a8
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_1ad

    .line 134
    .end local v12    # "col":I
    .end local v18    # "k":I
    .end local v20    # "row":I
    .end local v22    # "sp_m_idx":I
    .end local v23    # "sp_p_idx":I
    .end local v25    # "t":I
    .end local v29    # "vm_idx":I
    .end local v30    # "vp_idx":I
    :cond_2ac
    const/16 v31, 0x0

    return v31
.end method

.method private static transferGaussPixels([D[D[III)V
    .registers 19
    .param p0, "src1"    # [D
    .param p1, "src2"    # [D
    .param p2, "dest"    # [I
    .param p3, "bytes"    # I
    .param p4, "width"    # I

    .prologue
    .line 200
    mul-int v1, p3, p4

    .line 203
    .local v1, "bend":I
    const/4 v6, 0x0

    .local v6, "k":I
    move v4, v6

    .local v4, "j":I
    move v2, v6

    .line 204
    .local v2, "i":I
    const/4 v0, 0x0

    .local v0, "b":I
    move v7, v6

    .end local v6    # "k":I
    .local v7, "k":I
    move v5, v4

    .end local v4    # "j":I
    .local v5, "j":I
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_9
    if-ge v0, v1, :cond_37

    .line 205
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-wide v10, p0, v3

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "j":I
    .restart local v4    # "j":I
    aget-wide v12, p1, v5

    add-double v8, v10, v12

    .line 207
    .local v8, "sum":D
    const-wide v10, 0x406fe00000000000L

    cmpl-double v10, v8, v10

    if-lez v10, :cond_2e

    .line 208
    const-wide v8, 0x406fe00000000000L

    .line 212
    :cond_23
    :goto_23
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "k":I
    .restart local v6    # "k":I
    double-to-int v10, v8

    aput v10, p2, v7

    .line 204
    add-int/lit8 v0, v0, 0x1

    move v7, v6

    .end local v6    # "k":I
    .restart local v7    # "k":I
    move v5, v4

    .end local v4    # "j":I
    .restart local v5    # "j":I
    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_9

    .line 209
    .end local v3    # "i":I
    .end local v5    # "j":I
    .restart local v2    # "i":I
    .restart local v4    # "j":I
    :cond_2e
    const-wide/16 v10, 0x0

    cmpg-double v10, v8, v10

    if-gez v10, :cond_23

    .line 210
    const-wide/16 v8, 0x0

    goto :goto_23

    .line 214
    .end local v2    # "i":I
    .end local v4    # "j":I
    .end local v8    # "sum":D
    .restart local v3    # "i":I
    .restart local v5    # "j":I
    :cond_37
    return-void
.end method
