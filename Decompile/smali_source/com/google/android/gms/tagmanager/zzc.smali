.class Lcom/google/android/gms/tagmanager/zzc;
.super Lcom/google/android/gms/tagmanager/zzak;


# static fields
.field private static final ID:Ljava/lang/String;


# instance fields
.field private final zzaOI:Lcom/google/android/gms/tagmanager/zza;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbg:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzc;->ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zza;->zzaL(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zza;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzc;-><init>(Lcom/google/android/gms/tagmanager/zza;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/tagmanager/zza;)V
    .registers 4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzc;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzc;->zzaOI:Lcom/google/android/gms/tagmanager/zza;

    return-void
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 3
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

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzc;->zzaOI:Lcom/google/android/gms/tagmanager/zza;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zza;->isLimitAdTrackingEnabled()Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    return-object v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
