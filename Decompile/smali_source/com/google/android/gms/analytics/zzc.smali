.class public final Lcom/google/android/gms/analytics/zzc;
.super Ljava/lang/Object;


# direct methods
.method public static zzP(I)Ljava/lang/String;
    .registers 2

    const-string v0, "cd"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzR(I)Ljava/lang/String;
    .registers 2

    const-string v0, "cm"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzS(I)Ljava/lang/String;
    .registers 2

    const-string v0, "&pr"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzT(I)Ljava/lang/String;
    .registers 2

    const-string v0, "pr"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzU(I)Ljava/lang/String;
    .registers 2

    const-string v0, "&promo"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzV(I)Ljava/lang/String;
    .registers 2

    const-string v0, "promo"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzW(I)Ljava/lang/String;
    .registers 2

    const-string v0, "pi"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzX(I)Ljava/lang/String;
    .registers 2

    const-string v0, "&il"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzY(I)Ljava/lang/String;
    .registers 2

    const-string v0, "il"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzZ(I)Ljava/lang/String;
    .registers 2

    const-string v0, "cd"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzaa(I)Ljava/lang/String;
    .registers 2

    const-string v0, "cm"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/zzc;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static zzc(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x1

    if-ge p1, v0, :cond_b

    const-string v0, "index out of range for prefix"

    invoke-static {v0, p0}, Lcom/google/android/gms/analytics/internal/zzae;->zzf(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, ""

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
