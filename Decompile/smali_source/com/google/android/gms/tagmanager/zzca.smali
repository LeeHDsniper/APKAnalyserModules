.class public abstract Lcom/google/android/gms/tagmanager/zzca;
.super Lcom/google/android/gms/tagmanager/zzak;


# static fields
.field private static final zzaPY:Ljava/lang/String;

.field private static final zzaQW:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdz:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzca;->zzaPY:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdA:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzca;->zzaQW:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/tagmanager/zzca;->zzaPY:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/tagmanager/zzca;->zzaQW:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic zzAc()Ljava/lang/String;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzak;->zzAc()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzAd()Ljava/util/Set;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzak;->zzAd()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Lcom/google/android/gms/internal/zzag$zza;"
        }
    .end annotation

    const/4 v2, 0x0

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v3

    if-ne v0, v3, :cond_9

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    :goto_23
    return-object v0

    :cond_24
    sget-object v0, Lcom/google/android/gms/tagmanager/zzca;->zzaPY:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    sget-object v1, Lcom/google/android/gms/tagmanager/zzca;->zzaQW:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_38

    if-nez v1, :cond_42

    :cond_38
    move v0, v2

    :goto_39
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_23

    :cond_42
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/gms/tagmanager/zzca;->zza(Lcom/google/android/gms/internal/zzag$zza;Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Map;)Z

    move-result v0

    goto :goto_39
.end method

.method protected abstract zza(Lcom/google/android/gms/internal/zzag$zza;Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Map;)Z
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
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
