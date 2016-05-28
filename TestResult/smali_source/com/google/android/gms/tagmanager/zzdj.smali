.class Lcom/google/android/gms/tagmanager/zzdj;
.super Ljava/lang/Object;


# direct methods
.method private static zza(Lcom/google/android/gms/tagmanager/zzbw;)Lcom/google/android/gms/tagmanager/zzbw;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzbw;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdj;->zzff(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/tagmanager/zzbw;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzbw;->zzAq()Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzbw;-><init>(Ljava/lang/Object;Z)V
    :try_end_1b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_1b} :catch_1d

    move-object p0, v0

    :goto_1c
    return-object p0

    :catch_1d
    move-exception v0

    const-string v1, "Escape URI: unsupported encoding"

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1c
.end method

.method private static zza(Lcom/google/android/gms/tagmanager/zzbw;I)Lcom/google/android/gms/tagmanager/zzbw;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;I)",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzbw;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdj;->zzn(Lcom/google/android/gms/internal/zzag$zza;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "Escaping can only be applied to strings."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :goto_11
    return-object p0

    :cond_12
    packed-switch p1, :pswitch_data_32

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported Value Escaping: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_11

    :pswitch_2c
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdj;->zza(Lcom/google/android/gms/tagmanager/zzbw;)Lcom/google/android/gms/tagmanager/zzbw;

    move-result-object p0

    goto :goto_11

    nop

    :pswitch_data_32
    .packed-switch 0xc
        :pswitch_2c
    .end packed-switch
.end method

.method static varargs zza(Lcom/google/android/gms/tagmanager/zzbw;[I)Lcom/google/android/gms/tagmanager/zzbw;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;[I)",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;"
        }
    .end annotation

    array-length v1, p1

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_d

    aget v2, p1, v0

    invoke-static {p0, v2}, Lcom/google/android/gms/tagmanager/zzdj;->zza(Lcom/google/android/gms/tagmanager/zzbw;I)Lcom/google/android/gms/tagmanager/zzbw;

    move-result-object p0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_d
    return-object p0
.end method

.method static zzff(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\+"

    const-string v2, "%20"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static zzn(Lcom/google/android/gms/internal/zzag$zza;)Z
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    return v0
.end method
