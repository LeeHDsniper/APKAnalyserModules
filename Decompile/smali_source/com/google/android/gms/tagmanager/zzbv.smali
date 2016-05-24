.class abstract Lcom/google/android/gms/tagmanager/zzbv;
.super Lcom/google/android/gms/tagmanager/zzca;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzca;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected zza(Lcom/google/android/gms/internal/zzag$zza;Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Map;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzag$zza;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdf;->zzh(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v0

    invoke-static {p2}, Lcom/google/android/gms/tagmanager/zzdf;->zzh(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBe()Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v2

    if-eq v0, v2, :cond_14

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBe()Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v2

    if-ne v1, v2, :cond_16

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0

    :cond_16
    invoke-virtual {p0, v0, v1, p3}, Lcom/google/android/gms/tagmanager/zzbv;->zza(Lcom/google/android/gms/tagmanager/zzde;Lcom/google/android/gms/tagmanager/zzde;Ljava/util/Map;)Z

    move-result v0

    goto :goto_15
.end method

.method protected abstract zza(Lcom/google/android/gms/tagmanager/zzde;Lcom/google/android/gms/tagmanager/zzde;Ljava/util/Map;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/zzde;",
            "Lcom/google/android/gms/tagmanager/zzde;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)Z"
        }
    .end annotation
.end method
