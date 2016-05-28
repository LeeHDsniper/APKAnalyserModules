.class public Lcom/google/android/gms/tagmanager/zzk;
.super Ljava/lang/Object;


# direct methods
.method public static zzet(Ljava/lang/String;)[B
    .registers 9

    const/16 v7, 0x10

    const/4 v6, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v0, v1, 0x2

    if-eqz v0, :cond_13

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "purported base16 string has odd number of characters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    div-int/lit8 v0, v1, 0x2

    new-array v2, v0, [B

    const/4 v0, 0x0

    :goto_18
    if-ge v0, v1, :cond_43

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    if-eq v3, v6, :cond_30

    if-ne v4, v6, :cond_38

    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "purported base16 string has illegal char"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_38
    div-int/lit8 v5, v0, 0x2

    shl-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v2, v5

    add-int/lit8 v0, v0, 0x2

    goto :goto_18

    :cond_43
    return-object v2
.end method

.method public static zzi([B)Ljava/lang/String;
    .registers 6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    array-length v2, p0

    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_20

    aget-byte v3, p0, v0

    and-int/lit16 v4, v3, 0xf0

    if-nez v4, :cond_14

    const-string v4, "0"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_14
    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
