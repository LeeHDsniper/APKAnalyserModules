.class public Lorg/apache/commons/lang3/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# direct methods
.method public static isEmpty(Ljava/lang/CharSequence;)Z
    .registers 2
    .param p0, "cs"    # Ljava/lang/CharSequence;

    .prologue
    .line 209
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static repeat(CI)Ljava/lang/String;
    .registers 5
    .param p0, "ch"    # C
    .param p1, "repeat"    # I

    .prologue
    .line 5236
    new-array v0, p1, [C

    .line 5237
    .local v0, "buf":[C
    add-int/lit8 v1, p1, -0x1

    .local v1, "i":I
    :goto_4
    if-ltz v1, :cond_b

    .line 5238
    aput-char p0, v0, v1

    .line 5237
    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    .line 5240
    :cond_b
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method public static rightPad(Ljava/lang/String;IC)Ljava/lang/String;
    .registers 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padChar"    # C

    .prologue
    .line 5288
    if-nez p0, :cond_4

    .line 5289
    const/4 p0, 0x0

    .line 5298
    .end local p0    # "str":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 5291
    .restart local p0    # "str":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, p1, v1

    .line 5292
    .local v0, "pads":I
    if-lez v0, :cond_3

    .line 5295
    const/16 v1, 0x2000

    if-le v0, v1, :cond_19

    .line 5296
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3

    .line 5298
    :cond_19
    invoke-static {p2, v0}, Lorg/apache/commons/lang3/StringUtils;->repeat(CI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method public static rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padStr"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 5325
    if-nez p0, :cond_5

    .line 5326
    const/4 p0, 0x0

    .line 5351
    .end local p0    # "str":Ljava/lang/String;
    :cond_4
    :goto_4
    return-object p0

    .line 5328
    .restart local p0    # "str":Ljava/lang/String;
    :cond_5
    invoke-static {p2}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 5329
    const-string p2, " "

    .line 5331
    :cond_d
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 5332
    .local v2, "padLen":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 5333
    .local v5, "strLen":I
    sub-int v4, p1, v5

    .line 5334
    .local v4, "pads":I
    if-lez v4, :cond_4

    .line 5337
    const/4 v6, 0x1

    if-ne v2, v6, :cond_29

    const/16 v6, 0x2000

    if-gt v4, v6, :cond_29

    .line 5338
    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {p0, p1, v6}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 5341
    :cond_29
    if-ne v4, v2, :cond_30

    .line 5342
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 5343
    :cond_30
    if-ge v4, v2, :cond_3b

    .line 5344
    invoke-virtual {p2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 5346
    :cond_3b
    new-array v3, v4, [C

    .line 5347
    .local v3, "padding":[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 5348
    .local v1, "padChars":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_42
    if-ge v0, v4, :cond_4d

    .line 5349
    rem-int v6, v0, v2

    aget-char v6, v1, v6

    aput-char v6, v3, v0

    .line 5348
    add-int/lit8 v0, v0, 0x1

    goto :goto_42

    .line 5351
    :cond_4d
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4
.end method
