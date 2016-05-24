.class Lcom/google/android/gms/tagmanager/zzt;
.super Lcom/google/android/gms/tagmanager/zzak;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzt$zza;
    }
.end annotation


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final zzaOL:Ljava/lang/String;

.field private static final zzaPx:Ljava/lang/String;


# instance fields
.field private final zzaPy:Lcom/google/android/gms/tagmanager/zzt$zza;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbw:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzt;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfk:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzt;->zzaPx:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdn:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzt;->zzaOL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/zzt$zza;)V
    .registers 6

    sget-object v0, Lcom/google/android/gms/tagmanager/zzt;->ID:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/tagmanager/zzt;->zzaPx:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzt;->zzaPy:Lcom/google/android/gms/tagmanager/zzt$zza;

    return-void
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 7
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

    sget-object v0, Lcom/google/android/gms/tagmanager/zzt;->zzaPx:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzt;->zzaOL:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_53

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Ljava/util/Map;

    if-nez v3, :cond_2d

    const-string v0, "FunctionCallMacro: expected ADDITIONAL_PARAMS to be a map."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    :goto_2c
    return-object v0

    :cond_2d
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_37
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_53

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_37

    :cond_53
    :try_start_53
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzt;->zzaPy:Lcom/google/android/gms/tagmanager/zzt$zza;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzt$zza;->zzd(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_5c} :catch_5e

    move-result-object v0

    goto :goto_2c

    :catch_5e
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Custom macro/tag "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " threw exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_2c
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
