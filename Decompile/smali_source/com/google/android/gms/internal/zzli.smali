.class public final Lcom/google/android/gms/internal/zzli;
.super Ljava/lang/Object;


# direct methods
.method public static zza(Ljava/lang/StringBuilder;[D)V
    .registers 6

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget-wide v2, p1, v0

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[F)V
    .registers 5

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget v2, p1, v0

    invoke-static {v2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[I)V
    .registers 5

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget v2, p1, v0

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[J)V
    .registers 6

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget-wide v2, p1, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/StringBuilder;",
            "[TT;)V"
        }
    .end annotation

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[Ljava/lang/String;)V
    .registers 6

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_1f

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    const-string v2, "\""

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_1f
    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;[Z)V
    .registers 5

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_17

    if-eqz v0, :cond_b

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    aget-boolean v2, p1, v0

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_17
    return-void
.end method
