.class public Lorg/apache/commons/io/FilenameUtils;
.super Ljava/lang/Object;
.source "FilenameUtils.java"


# static fields
.field public static final EXTENSION_SEPARATOR_STR:Ljava/lang/String;

.field private static final OTHER_SEPARATOR:C

.field private static final SYSTEM_SEPARATOR:C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 95
    const/16 v0, 0x2e

    invoke-static {v0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/io/FilenameUtils;->EXTENSION_SEPARATOR_STR:Ljava/lang/String;

    .line 110
    sget-char v0, Ljava/io/File;->separatorChar:C

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    .line 117
    invoke-static {}, Lorg/apache/commons/io/FilenameUtils;->isSystemWindows()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 118
    const/16 v0, 0x2f

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    .line 122
    :goto_16
    return-void

    .line 120
    :cond_17
    const/16 v0, 0x5c

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    goto :goto_16
.end method

.method public static concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "basePath"    # Ljava/lang/String;
    .param p1, "fullFilenameToAdd"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 482
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v2

    .line 483
    .local v2, "prefix":I
    if-gez v2, :cond_8

    .line 500
    :cond_7
    :goto_7
    return-object v3

    .line 486
    :cond_8
    if-lez v2, :cond_f

    .line 487
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 489
    :cond_f
    if-eqz p0, :cond_7

    .line 492
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 493
    .local v1, "len":I
    if-nez v1, :cond_1c

    .line 494
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 496
    :cond_1c
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 497
    .local v0, "ch":C
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 498
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 500
    :cond_3e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7
.end method

.method private static doNormalize(Ljava/lang/String;CZ)Ljava/lang/String;
    .registers 14
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "separator"    # C
    .param p2, "keepSeparator"    # Z

    .prologue
    .line 348
    if-nez p0, :cond_4

    .line 349
    const/4 p0, 0x0

    .line 437
    .end local p0    # "filename":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 351
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 352
    .local v6, "size":I
    if-eqz v6, :cond_3

    .line 355
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v5

    .line 356
    .local v5, "prefix":I
    if-gez v5, :cond_12

    .line 357
    const/4 p0, 0x0

    goto :goto_3

    .line 360
    :cond_12
    add-int/lit8 v8, v6, 0x2

    new-array v0, v8, [C

    .line 361
    .local v0, "array":[C
    const/4 v8, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {p0, v8, v9, v0, v10}, Ljava/lang/String;->getChars(II[CI)V

    .line 364
    sget-char v8, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne p1, v8, :cond_32

    sget-char v4, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    .line 365
    .local v4, "otherSeparator":C
    :goto_25
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    array-length v8, v0

    if-ge v1, v8, :cond_35

    .line 366
    aget-char v8, v0, v1

    if-ne v8, v4, :cond_2f

    .line 367
    aput-char p1, v0, v1

    .line 365
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 364
    .end local v1    # "i":I
    .end local v4    # "otherSeparator":C
    :cond_32
    sget-char v4, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    goto :goto_25

    .line 372
    .restart local v1    # "i":I
    .restart local v4    # "otherSeparator":C
    :cond_35
    const/4 v3, 0x1

    .line 373
    .local v3, "lastIsDirectory":Z
    add-int/lit8 v8, v6, -0x1

    aget-char v8, v0, v8

    if-eq v8, p1, :cond_42

    .line 374
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "size":I
    .local v7, "size":I
    aput-char p1, v0, v6

    .line 375
    const/4 v3, 0x0

    move v6, v7

    .line 379
    .end local v7    # "size":I
    .restart local v6    # "size":I
    :cond_42
    add-int/lit8 v1, v5, 0x1

    :goto_44
    if-ge v1, v6, :cond_5e

    .line 380
    aget-char v8, v0, v1

    if-ne v8, p1, :cond_5b

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    if-ne v8, p1, :cond_5b

    .line 381
    add-int/lit8 v8, v1, -0x1

    sub-int v9, v6, v1

    invoke-static {v0, v1, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 382
    add-int/lit8 v6, v6, -0x1

    .line 383
    add-int/lit8 v1, v1, -0x1

    .line 379
    :cond_5b
    add-int/lit8 v1, v1, 0x1

    goto :goto_44

    .line 388
    :cond_5e
    add-int/lit8 v1, v5, 0x1

    :goto_60
    if-ge v1, v6, :cond_8d

    .line 389
    aget-char v8, v0, v1

    if-ne v8, p1, :cond_8a

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    const/16 v9, 0x2e

    if-ne v8, v9, :cond_8a

    add-int/lit8 v8, v5, 0x1

    if-eq v1, v8, :cond_78

    add-int/lit8 v8, v1, -0x2

    aget-char v8, v0, v8

    if-ne v8, p1, :cond_8a

    .line 391
    :cond_78
    add-int/lit8 v8, v6, -0x1

    if-ne v1, v8, :cond_7d

    .line 392
    const/4 v3, 0x1

    .line 394
    :cond_7d
    add-int/lit8 v8, v1, 0x1

    add-int/lit8 v9, v1, -0x1

    sub-int v10, v6, v1

    invoke-static {v0, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 395
    add-int/lit8 v6, v6, -0x2

    .line 396
    add-int/lit8 v1, v1, -0x1

    .line 388
    :cond_8a
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 402
    :cond_8d
    add-int/lit8 v1, v5, 0x2

    :goto_8f
    if-ge v1, v6, :cond_e5

    .line 403
    aget-char v8, v0, v1

    if-ne v8, p1, :cond_d1

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    const/16 v9, 0x2e

    if-ne v8, v9, :cond_d1

    add-int/lit8 v8, v1, -0x2

    aget-char v8, v0, v8

    const/16 v9, 0x2e

    if-ne v8, v9, :cond_d1

    add-int/lit8 v8, v5, 0x2

    if-eq v1, v8, :cond_af

    add-int/lit8 v8, v1, -0x3

    aget-char v8, v0, v8

    if-ne v8, p1, :cond_d1

    .line 405
    :cond_af
    add-int/lit8 v8, v5, 0x2

    if-ne v1, v8, :cond_b6

    .line 406
    const/4 p0, 0x0

    goto/16 :goto_3

    .line 408
    :cond_b6
    add-int/lit8 v8, v6, -0x1

    if-ne v1, v8, :cond_bb

    .line 409
    const/4 v3, 0x1

    .line 412
    :cond_bb
    add-int/lit8 v2, v1, -0x4

    .local v2, "j":I
    :goto_bd
    if-lt v2, v5, :cond_d7

    .line 413
    aget-char v8, v0, v2

    if-ne v8, p1, :cond_d4

    .line 415
    add-int/lit8 v8, v1, 0x1

    add-int/lit8 v9, v2, 0x1

    sub-int v10, v6, v1

    invoke-static {v0, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 416
    sub-int v8, v1, v2

    sub-int/2addr v6, v8

    .line 417
    add-int/lit8 v1, v2, 0x1

    .line 402
    .end local v2    # "j":I
    :cond_d1
    :goto_d1
    add-int/lit8 v1, v1, 0x1

    goto :goto_8f

    .line 412
    .restart local v2    # "j":I
    :cond_d4
    add-int/lit8 v2, v2, -0x1

    goto :goto_bd

    .line 422
    :cond_d7
    add-int/lit8 v8, v1, 0x1

    sub-int v9, v6, v1

    invoke-static {v0, v8, v0, v5, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    add-int/lit8 v8, v1, 0x1

    sub-int/2addr v8, v5

    sub-int/2addr v6, v8

    .line 424
    add-int/lit8 v1, v5, 0x1

    goto :goto_d1

    .line 428
    .end local v2    # "j":I
    :cond_e5
    if-gtz v6, :cond_eb

    .line 429
    const-string p0, ""

    goto/16 :goto_3

    .line 431
    :cond_eb
    if-gt v6, v5, :cond_f5

    .line 432
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    const/4 v8, 0x0

    invoke-direct {p0, v0, v8, v6}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_3

    .line 434
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_f5
    if-eqz v3, :cond_101

    if-eqz p2, :cond_101

    .line 435
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    const/4 v8, 0x0

    invoke-direct {p0, v0, v8, v6}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_3

    .line 437
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_101
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    const/4 v8, 0x0

    add-int/lit8 v9, v6, -0x1

    invoke-direct {p0, v0, v8, v9}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_3
.end method

.method public static getName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 949
    if-nez p0, :cond_4

    .line 950
    const/4 v1, 0x0

    .line 953
    :goto_3
    return-object v1

    .line 952
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfLastSeparator(Ljava/lang/String;)I

    move-result v0

    .line 953
    .local v0, "index":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static getPrefixLength(Ljava/lang/String;)I
    .registers 12
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x2f

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x2

    const/4 v7, -0x1

    .line 623
    if-nez p0, :cond_a

    move v5, v7

    .line 671
    :cond_9
    :goto_9
    return v5

    .line 626
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 627
    .local v2, "len":I
    if-nez v2, :cond_12

    move v5, v6

    .line 628
    goto :goto_9

    .line 630
    :cond_12
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 631
    .local v0, "ch0":C
    const/16 v9, 0x3a

    if-ne v0, v9, :cond_1c

    move v5, v7

    .line 632
    goto :goto_9

    .line 634
    :cond_1c
    if-ne v2, v5, :cond_2c

    .line 635
    const/16 v7, 0x7e

    if-ne v0, v7, :cond_24

    move v5, v8

    .line 636
    goto :goto_9

    .line 638
    :cond_24
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v7

    if-nez v7, :cond_9

    move v5, v6

    goto :goto_9

    .line 640
    :cond_2c
    const/16 v9, 0x7e

    if-ne v0, v9, :cond_4e

    .line 641
    invoke-virtual {p0, v10, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 642
    .local v3, "posUnix":I
    const/16 v6, 0x5c

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 643
    .local v4, "posWin":I
    if-ne v3, v7, :cond_41

    if-ne v4, v7, :cond_41

    .line 644
    add-int/lit8 v5, v2, 0x1

    goto :goto_9

    .line 646
    :cond_41
    if-ne v3, v7, :cond_44

    move v3, v4

    .line 647
    :cond_44
    if-ne v4, v7, :cond_47

    move v4, v3

    .line 648
    :cond_47
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 650
    .end local v3    # "posUnix":I
    .end local v4    # "posWin":I
    :cond_4e
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 651
    .local v1, "ch1":C
    const/16 v9, 0x3a

    if-ne v1, v9, :cond_74

    .line 652
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 653
    const/16 v5, 0x41

    if-lt v0, v5, :cond_72

    const/16 v5, 0x5a

    if-gt v0, v5, :cond_72

    .line 654
    if-eq v2, v8, :cond_6e

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v5

    if-nez v5, :cond_70

    :cond_6e
    move v5, v8

    .line 655
    goto :goto_9

    .line 657
    :cond_70
    const/4 v5, 0x3

    goto :goto_9

    :cond_72
    move v5, v7

    .line 659
    goto :goto_9

    .line 661
    :cond_74
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v9

    if-eqz v9, :cond_a3

    invoke-static {v1}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v9

    if-eqz v9, :cond_a3

    .line 662
    invoke-virtual {p0, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 663
    .restart local v3    # "posUnix":I
    const/16 v5, 0x5c

    invoke-virtual {p0, v5, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 664
    .restart local v4    # "posWin":I
    if-ne v3, v7, :cond_8e

    if-eq v4, v7, :cond_92

    :cond_8e
    if-eq v3, v8, :cond_92

    if-ne v4, v8, :cond_95

    :cond_92
    move v5, v7

    .line 665
    goto/16 :goto_9

    .line 667
    :cond_95
    if-ne v3, v7, :cond_98

    move v3, v4

    .line 668
    :cond_98
    if-ne v4, v7, :cond_9b

    move v4, v3

    .line 669
    :cond_9b
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_9

    .line 671
    .end local v3    # "posUnix":I
    .end local v4    # "posWin":I
    :cond_a3
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v7

    if-nez v7, :cond_9

    move v5, v6

    goto/16 :goto_9
.end method

.method public static indexOfLastSeparator(Ljava/lang/String;)I
    .registers 4
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 689
    if-nez p0, :cond_4

    .line 690
    const/4 v2, -0x1

    .line 694
    :goto_3
    return v2

    .line 692
    :cond_4
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 693
    .local v0, "lastUnixPos":I
    const/16 v2, 0x5c

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 694
    .local v1, "lastWindowsPos":I
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_3
.end method

.method private static isSeparator(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 149
    const/16 v0, 0x2f

    if-eq p0, v0, :cond_8

    const/16 v0, 0x5c

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static isSystemWindows()Z
    .registers 2

    .prologue
    .line 138
    sget-char v0, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 194
    sget-char v0, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FilenameUtils;->doNormalize(Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
